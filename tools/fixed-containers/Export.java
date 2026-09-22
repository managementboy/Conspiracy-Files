import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import zombie.iso.RoomDef;

/**
 * Offline Build 42 fixed-container census.
 *
 * Uses the game's own POT lot readers, but never starts a world and never
 * writes game/save data. Output is a deterministic TSV consumed by build.py.
 */
public final class Export {
    private static final Pattern CELL = Pattern.compile("(-?\\d+)_(-?\\d+)\\.lotheader");
    private static final Pattern ASSIGN = Pattern.compile("^([A-Za-z0-9_]+)\\s*=\\s*(.*)$");
    private static final Pattern ADDRESS_ROW = Pattern.compile("^\\\"([^|\\\"]+)\\|(-?\\d+)\\|(-?\\d+)\\|(-?\\d+)\\|(-?\\d+)\\|.*");

    private record TileContainers(String primary, boolean freezer) {}
    private record Row(String building, int x, int y, int z, String sprite, String type, String room) {}
    private record AddressBuilding(String id, int x, int y, int x2, int y2) {
        int area() { return (x2 - x) * (y2 - y); }
        boolean encloses(RoomDef room) {
            return room.getX() >= x && room.getY() >= y && room.getX2() <= x2 && room.getY2() <= y2;
        }
    }

    private Export() {}

    public static void main(String[] args) throws Exception {
        if (args.length != 6) {
            System.err.println("usage: Export <projectzomboid media> <map directory> <map id> <build> <building-census.tsv> <output.tsv>");
            System.exit(2);
        }
        Path media = Path.of(args[0]).toAbsolutePath().normalize();
        Path mapDir = Path.of(args[1]).toAbsolutePath().normalize();
        String mapId = checkedText(args[2], "map id");
        String build = checkedText(args[3], "build");
        Path buildingCensus = Path.of(args[4]).toAbsolutePath().normalize();
        Path output = Path.of(args[5]).toAbsolutePath().normalize();
        if (!Files.isDirectory(media) || !Files.isDirectory(mapDir)) throw new IOException("media/map directory missing");

        Map<String, TileContainers> containers = parseTileDefinitions(media);
        if (containers.isEmpty()) throw new IOException("no container tile definitions found");
        System.err.println("container sprites " + containers.size() + ", sample " + containers.keySet().stream().sorted().findFirst().orElse("-"));
        List<Path> headers;
        String onlyCell = System.getProperty("cf.export.cell");
        try (var stream = Files.list(mapDir)) {
            headers = stream.filter(path -> CELL.matcher(path.getFileName().toString()).matches())
                .filter(path -> onlyCell == null || path.getFileName().toString().equals(onlyCell + ".lotheader"))
                .sorted(Comparator.comparing(path -> path.getFileName().toString())).toList();
        }
        if (headers.isEmpty()) throw new IOException("no .lotheader files found");
        Map<Long, List<AddressBuilding>> addressBuildings = parseAddressBuildings(buildingCensus);

        var headerClass = Class.forName("zombie.pot.POTLotHeader");
        Constructor<?> headerCtor = headerClass.getDeclaredConstructor(int.class, int.class, boolean.class);
        headerCtor.setAccessible(true);
        Method loadHeader = headerClass.getDeclaredMethod("load", File.class);
        loadHeader.setAccessible(true);
        var packClass = Class.forName("zombie.pot.POTLotPack");
        Constructor<?> packCtor = packClass.getDeclaredConstructor(headerClass);
        packCtor.setAccessible(true);
        Method loadPack = packClass.getDeclaredMethod("load", File.class);
        loadPack.setAccessible(true);
        Method squareData = packClass.getDeclaredMethod("getSquareData", int.class, int.class, int.class);
        squareData.setAccessible(true);

        Files.createDirectories(output.getParent());
        Path temporary = output.resolveSibling(output.getFileName() + ".tmp");
        long rows = 0;
        Set<String> seen = new LinkedHashSet<>();
        Set<String> sampleTiles = new LinkedHashSet<>();
        int maxCells = Integer.getInteger("cf.export.maxCells", Integer.MAX_VALUE);
        boolean tracedRoom = false;
        long unresolvedRooms = 0;
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (BufferedWriter writer = Files.newBufferedWriter(temporary, StandardCharsets.UTF_8,
                StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
            writer.write("#fixed-container-index-v1\t" + escape(mapId) + "\t" + escape(build)
                + "\ttiles=" + sha256TileDefinitions(media) + "\n");
            int done = 0;
            for (Path headerPath : headers) {
                Matcher match = CELL.matcher(headerPath.getFileName().toString());
                if (!match.matches()) continue;
                int cellX = Integer.parseInt(match.group(1));
                int cellY = Integer.parseInt(match.group(2));
                Path packPath = headerPath.resolveSibling("world_" + cellX + "_" + cellY + ".lotpack");
                if (!Files.isRegularFile(packPath)) continue;
                // map.info identifies the shipped Muldraugh aggregate as POT:
                // 256-square cells made from 32 chunks of 8.
                Object header = headerCtor.newInstance(cellX, cellY, true);
                loadHeader.invoke(header, headerPath.toFile());
                @SuppressWarnings("unchecked")
                List<RoomDef> allRooms = (List<RoomDef>) headerClass.getField("roomList").get(header);
                List<AddressBuilding> nearbyBuildings = nearbyBuildings(addressBuildings, cellX, cellY);
                if (onlyCell != null) {
                    System.err.printf(Locale.ROOT, "cell %s: rooms=%d%n", onlyCell, allRooms.size());
                }
                if (!allRooms.isEmpty() || !nearbyBuildings.isEmpty()) {
                    Object pack = packCtor.newInstance(header);
                    loadPack.invoke(pack, packPath.toFile());
                    for (RoomDef room : allRooms) {
                        AddressBuilding building = resolveBuilding(addressBuildings, room);
                        if (building == null) { unresolvedRooms++; continue; }
                        String buildingId = building.id();
                            String roomName = nullableText(room.getName());
                            int z = room.getZ();
                            for (RoomDef.RoomRect rect : room.getRects()) {
                                if (!tracedRoom) {
                                    System.err.printf(Locale.ROOT,
                                        "sample room cell=%d,%d building=%s room=%s z=%d rect=%d,%d..%d,%d%n",
                                        cellX, cellY, buildingId, roomName, z, rect.getX(), rect.getY(), rect.getX2(), rect.getY2());
                                    tracedRoom = true;
                                }
                                int cellMinX = cellX * 256, cellMinY = cellY * 256;
                                int fromX = Math.max(rect.getX(), cellMinX), toX = Math.min(rect.getX2(), cellMinX + 256);
                                int fromY = Math.max(rect.getY(), cellMinY), toY = Math.min(rect.getY2(), cellMinY + 256);
                                for (int y = fromY; y < toY; y++) {
                                    for (int x = fromX; x < toX; x++) {
                                        String[] tiles = (String[]) squareData.invoke(pack, x, y, z);
                                        if (tiles == null) continue;
                                        for (String sprite : tiles) {
                                            if (sampleTiles.size() < 40) sampleTiles.add(sprite);
                                            TileContainers kinds = containers.get(sprite);
                                            if (kinds == null) continue;
                                            rows += write(writer, seen, digest,
                                                new Row(buildingId, x, y, z, sprite, kinds.primary(), roomName));
                                            if (kinds.freezer()) {
                                                rows += write(writer, seen, digest,
                                                    new Row(buildingId, x, y, z, sprite, "freezer", roomName));
                                            }
                                        }
                                    }
                                }
                            }
                    }
                    // Mailboxes are fixed furniture but usually stand just
                    // outside any room. Scan only the same twelve-tile building
                    // band the runtime historically used, then associate each
                    // physical postbox with the nearest BuildingDef footprint.
                    int cellMinX = cellX * 256, cellMinY = cellY * 256;
                    Map<String, String> postboxes = new TreeMap<>();
                    for (AddressBuilding candidate : nearbyBuildings) {
                        int fromX = Math.max(candidate.x() - 12, cellMinX);
                        int toX = Math.min(candidate.x2() + 12, cellMinX + 256);
                        int fromY = Math.max(candidate.y() - 12, cellMinY);
                        int toY = Math.min(candidate.y2() + 12, cellMinY + 256);
                        for (int y = fromY; y < toY; y++) for (int x = fromX; x < toX; x++) {
                            String[] tiles = (String[]) squareData.invoke(pack, x, y, 0);
                            if (tiles == null) continue;
                            for (String sprite : tiles) {
                                TileContainers kinds = containers.get(sprite);
                                if (kinds != null && kinds.primary().equals("postbox")) postboxes.put(x + ":" + y + ":" + sprite, sprite);
                            }
                        }
                    }
                    for (Map.Entry<String, String> postbox : postboxes.entrySet()) {
                        String[] key = postbox.getKey().split(":", 3);
                        int x = Integer.parseInt(key[0]), y = Integer.parseInt(key[1]);
                        AddressBuilding nearest = nearestBuilding(nearbyBuildings, x, y, 12);
                        if (nearest != null) rows += write(writer, seen, digest,
                            new Row(nearest.id(), x, y, 0, postbox.getValue(), "postbox", null));
                    }
                }
                done++;
                if (done % 100 == 0) System.err.printf(Locale.ROOT, "cells %d/%d, rows %d%n", done, headers.size(), rows);
                if (done >= maxCells) break;
            }
            writer.write("#rows\t" + rows + "\tsha256=" + hex(digest.digest()) + "\n");
        }
        Files.move(temporary, output, java.nio.file.StandardCopyOption.REPLACE_EXISTING,
            java.nio.file.StandardCopyOption.ATOMIC_MOVE);
        System.err.println("sample lot tiles " + sampleTiles);
        System.err.printf(Locale.ROOT, "wrote %d unique fixed containers to %s (unresolved/outdoor rooms %d)%n",
            rows, output, unresolvedRooms);
    }

    private static Map<Long, List<AddressBuilding>> parseAddressBuildings(Path path) throws IOException {
        Map<Long, List<AddressBuilding>> buckets = new HashMap<>();
        int count = 0;
        for (String raw : Files.readAllLines(path, StandardCharsets.UTF_8)) {
            String line = raw.trim();
            Matcher row = ADDRESS_ROW.matcher(line);
            AddressBuilding building;
            if (row.matches()) {
                building = new AddressBuilding(row.group(1), Integer.parseInt(row.group(2)),
                    Integer.parseInt(row.group(3)), Integer.parseInt(row.group(4)), Integer.parseInt(row.group(5)));
            } else {
                String[] fields = line.split("\\t", -1);
                if (fields.length < 5 || fields[0].startsWith("#")) continue;
                building = new AddressBuilding(fields[0], Integer.parseInt(fields[1]), Integer.parseInt(fields[2]),
                    Integer.parseInt(fields[3]), Integer.parseInt(fields[4]));
            }
            for (int by = Math.floorDiv(building.y(), 256); by <= Math.floorDiv(building.y2() - 1, 256); by++) {
                for (int bx = Math.floorDiv(building.x(), 256); bx <= Math.floorDiv(building.x2() - 1, 256); bx++) {
                    buckets.computeIfAbsent(bucketKey(bx, by), ignored -> new ArrayList<>()).add(building);
                }
            }
            count++;
        }
        if (count < 9000) throw new IOException("AddressBook does not contain the full building census: " + count);
        System.err.println("address buildings " + count);
        return buckets;
    }

    private static AddressBuilding resolveBuilding(Map<Long, List<AddressBuilding>> buckets, RoomDef room) {
        List<AddressBuilding> candidates = buckets.get(bucketKey(Math.floorDiv(room.getX(), 256), Math.floorDiv(room.getY(), 256)));
        AddressBuilding best = null;
        for (AddressBuilding candidate : candidates == null ? List.<AddressBuilding>of() : candidates) {
            if (candidate.encloses(room) && (best == null || candidate.area() < best.area())) best = candidate;
        }
        return best;
    }

    private static List<AddressBuilding> nearbyBuildings(Map<Long, List<AddressBuilding>> buckets, int cellX, int cellY) {
        Map<String, AddressBuilding> unique = new HashMap<>();
        for (int by = cellY - 1; by <= cellY + 1; by++) for (int bx = cellX - 1; bx <= cellX + 1; bx++) {
            for (AddressBuilding building : buckets.getOrDefault(bucketKey(bx, by), List.of())) unique.put(building.id(), building);
        }
        return new ArrayList<>(unique.values());
    }

    private static AddressBuilding nearestBuilding(List<AddressBuilding> buildings, int x, int y, int radius) {
        AddressBuilding best = null;
        int bestDistance = Integer.MAX_VALUE;
        for (AddressBuilding building : buildings) {
            int dx = x < building.x() ? building.x() - x : x >= building.x2() ? x - building.x2() + 1 : 0;
            int dy = y < building.y() ? building.y() - y : y >= building.y2() ? y - building.y2() + 1 : 0;
            int distance = Math.max(dx, dy);
            if (distance <= radius && (distance < bestDistance || (distance == bestDistance &&
                    (best == null || building.id().compareTo(best.id()) < 0)))) {
                best = building; bestDistance = distance;
            }
        }
        return best;
    }

    private static long bucketKey(int x, int y) {
        return ((long)x << 32) ^ (y & 0xffffffffL);
    }

    private static int write(BufferedWriter writer, Set<String> seen, MessageDigest digest, Row row) throws IOException {
        String line = escape(row.building()) + '\t' + row.x() + '\t' + row.y() + '\t' + row.z() + '\t'
            + escape(row.sprite()) + '\t' + escape(row.type()) + '\t' + escape(row.room() == null ? "" : row.room());
        if (!seen.add(line)) return 0;
        writer.write(line);
        writer.write('\n');
        digest.update(line.getBytes(StandardCharsets.UTF_8));
        digest.update((byte)'\n');
        return 1;
    }

    private static Map<String, TileContainers> parseTileDefinitions(Path media) throws IOException {
        List<Path> files;
        try (var stream = Files.list(media)) {
            files = stream.filter(path -> path.getFileName().toString().endsWith(".tiles.txt"))
                .sorted(Comparator.comparing(path -> path.getFileName().toString())).toList();
        }
        Map<String, TileContainers> result = new HashMap<>();
        for (Path file : files) parseTileFile(file, result);
        return result;
    }

    private static void parseTileFile(Path file, Map<String, TileContainers> output) throws IOException {
        String tileset = null;
        int width = 0;
        boolean inTile = false;
        int x = -1, y = -1;
        String container = null;
        boolean freezer = false;
        for (String raw : Files.readAllLines(file, StandardCharsets.UTF_8)) {
            String line = raw.trim();
            if (line.equals("tile")) { inTile = true; x = y = -1; container = null; freezer = false; continue; }
            if (inTile && line.equals("}")) {
                if (tileset != null && width > 0 && x >= 0 && y >= 0 && container != null) {
                    String sprite = tileset + "_" + (y * width + x);
                    TileContainers old = output.get(sprite);
                    output.put(sprite, new TileContainers(container, freezer || (old != null && old.freezer())));
                }
                inTile = false; continue;
            }
            Matcher assignment = ASSIGN.matcher(line);
            if (!assignment.matches()) continue;
            String key = assignment.group(1), value = assignment.group(2).trim();
            if (!inTile) {
                if (key.equals("file")) tileset = value;
                else if (key.equals("size")) width = Integer.parseInt(value.split(",", 2)[0].trim());
            } else if (key.equals("xy")) {
                String[] pair = value.split(",", 2); x = Integer.parseInt(pair[0].trim()); y = Integer.parseInt(pair[1].trim());
            } else if (key.equals("container") && !value.isEmpty()) container = value;
            else if (key.equals("FreezerCapacity") && !value.isEmpty() && !value.equals("0")) freezer = true;
        }
    }

    private static String sha256TileDefinitions(Path media) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (var stream = Files.list(media)) {
            for (Path path : stream.filter(p -> p.getFileName().toString().endsWith(".tiles.txt"))
                    .sorted(Comparator.comparing(p -> p.getFileName().toString())).toList()) {
                digest.update(path.getFileName().toString().getBytes(StandardCharsets.UTF_8));
                digest.update(Files.readAllBytes(path));
            }
        }
        return hex(digest.digest());
    }

    private static String checkedText(String value, String name) {
        if (value == null || value.isBlank() || value.indexOf('\t') >= 0 || value.indexOf('\n') >= 0)
            throw new IllegalArgumentException("invalid " + name);
        return value;
    }

    private static String nullableText(String value) {
        return value == null || value.isBlank() ? null : checkedText(value, "room");
    }

    private static String escape(String value) {
        return value.replace("\\", "\\\\").replace("\t", "\\t").replace("\n", "\\n").replace("\r", "\\r");
    }

    private static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) out.append(String.format(Locale.ROOT, "%02x", value & 0xff));
        return out.toString();
    }
}
