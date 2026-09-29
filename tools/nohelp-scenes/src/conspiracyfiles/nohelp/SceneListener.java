// THE SCENE LISTENER (DR-20260929-NOHELP-GAP-PLAN, E4; ZombieBuddy is a
// required dependency, owner 2026-09-29). Every vanilla story the game builds
// passes through one of its story methods (ScenePatches, one advice per
// class). The OUTERMOST call on a thread is recorded - a story calling its
// parent's method is one scene - as one line:
//
//   kind|family|x1|y1|x2|y2|z|cx|cy
//
// kind: the story class's simple name (RBBar, RDSBandPractice, RZSVanCamp...);
// family: building, zone or vehicle; x1..y2: the building's, the zone's or the
// vehicle's spawn box; z: its floor; cx,cy: the story's own point where it has
// one (a zone story's picked square, a vehicle's spawn point), else the box's
// centre. Lines queue here, thread-safe (chunks may load off the Lua thread),
// and Lua drains them on its own tick with NHSceneDrain(). Nothing here may
// ever break the game: every read is guarded, every failure counted.
package conspiracyfiles.nohelp;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicLong;
import se.krka.kahlua.integration.annotations.LuaMethod;

public class SceneListener {
    public static final String VERSION = "2";
    static final int MAX_QUEUED = 4096;
    static final ConcurrentLinkedQueue<String> QUEUE = new ConcurrentLinkedQueue<>();
    static final AtomicLong SEEN = new AtomicLong(), DROPPED = new AtomicLong(), FAILED = new AtomicLong();
    static final ThreadLocal<int[]> DEPTH = ThreadLocal.withInitial(() -> new int[1]);
    static final ThreadLocal<String> PENDING = new ThreadLocal<>();
    // The first failure, kept for the status line: what broke, never a scene.
    static volatile String firstError = "";

    static void failed(Throwable t) {
        FAILED.incrementAndGet();
        if (firstError.isEmpty()) {
            String m = t.getClass().getSimpleName() + ":" + String.valueOf(t.getMessage());
            m = m.replace('|', '/').replace('\n', ' ').replace('\r', ' ');
            firstError = m.length() > 120 ? m.substring(0, 120) : m;
        }
    }

    public static void enter(Object story, String family, Object[] args) {
        try {
            int[] d = DEPTH.get();
            d[0]++;
            if (d[0] == 1) PENDING.set(describe(story, family, args));
        } catch (Throwable t) { failed(t); }
    }

    public static void exit() {
        try {
            int[] d = DEPTH.get();
            if (d[0] > 0) d[0]--;
            if (d[0] == 0) {
                String line = PENDING.get();
                PENDING.remove();
                if (line != null) {
                    SEEN.incrementAndGet();
                    if (QUEUE.size() >= MAX_QUEUED) DROPPED.incrementAndGet(); else QUEUE.add(line);
                }
            }
        } catch (Throwable t) { failed(t); }
    }

    static String describe(Object story, String family, Object[] args) {
        if (story == null || args == null || args.length == 0 || args[0] == null) return null;
        String kind = story.getClass().getSimpleName();
        int x1, y1, x2, y2, z, cx, cy;
        Object a = args[0];
        if (family.equals("building")) {
            x1 = call(a, "getX"); y1 = call(a, "getY"); x2 = call(a, "getX2"); y2 = call(a, "getY2");
            z = 0; cx = (x1 + x2) / 2; cy = (y1 + y2) / 2;
        } else {
            int zx = field(a, "x"), zy = field(a, "y"), zw = field(a, "w"), zh = field(a, "h");
            z = field(a, "z");
            x1 = zx; y1 = zy; x2 = zx + zw; y2 = zy + zh; cx = (x1 + x2) / 2; cy = (y1 + y2) / 2;
            if (family.equals("zone")) {
                int px = field(a, "pickedXForZoneStory"), py = field(a, "pickedYForZoneStory");
                if (px > 0 && py > 0) { cx = px; cy = py; }
            } else if (args.length > 1 && args[1] != null) {
                Object spawn = fieldObject(args[1], "vehicleStorySpawnData");
                if (spawn != null) {
                    x1 = field(spawn, "x1"); y1 = field(spawn, "y1"); x2 = field(spawn, "x2"); y2 = field(spawn, "y2");
                    cx = (int) floatField(spawn, "spawnX"); cy = (int) floatField(spawn, "spawnY");
                }
            }
        }
        return kind + "|" + family + "|" + x1 + "|" + y1 + "|" + x2 + "|" + y2 + "|" + z + "|" + cx + "|" + cy;
    }

    static int call(Object o, String name) {
        try { Method m = o.getClass().getMethod(name); return ((Number) m.invoke(o)).intValue(); }
        catch (Throwable t) { failed(t); return 0; }
    }
    static Field find(Class<?> c, String name) throws NoSuchFieldException {
        for (Class<?> k = c; k != null; k = k.getSuperclass()) {
            try { Field f = k.getDeclaredField(name); f.setAccessible(true); return f; } catch (NoSuchFieldException e) { }
        }
        throw new NoSuchFieldException(name);
    }
    static int field(Object o, String name) {
        try { return ((Number) find(o.getClass(), name).get(o)).intValue(); }
        catch (Throwable t) { failed(t); return 0; }
    }
    static float floatField(Object o, String name) {
        try { return ((Number) find(o.getClass(), name).get(o)).floatValue(); }
        catch (Throwable t) { failed(t); return 0f; }
    }
    static Object fieldObject(Object o, String name) {
        try { return find(o.getClass(), name).get(o); }
        catch (Throwable t) { failed(t); return null; }
    }

    // Lua: every waiting line, newline-separated ("" when none), at most `max`.
    @LuaMethod(name = "NHSceneDrain", global = true)
    public static String drain(double max) {
        StringBuilder out = new StringBuilder();
        int n = 0;
        String line;
        while (n < (int) max && (line = QUEUE.poll()) != null) {
            if (n > 0) out.append('\n');
            out.append(line);
            n++;
        }
        return out.toString();
    }

    // Lua: "version|seen|dropped|failed|queued|first error", so a playtest
    // and the log can say the listener is alive, how much it has seen, and
    // what broke first.
    @LuaMethod(name = "NHSceneListener", global = true)
    public static String status() {
        return VERSION + "|" + SEEN.get() + "|" + DROPPED.get() + "|" + FAILED.get() + "|" + QUEUE.size() + "|" + firstError;
    }
}
