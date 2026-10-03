// Run one Lua file inside the game's OWN Kahlua with the game's REAL classes
// exposed, headless (no window, no map). Wrong method names, wrong argument
// counts and wrong argument types fail here exactly as they do in the game -
// which the hand-made fakes in test/*.lua cannot promise.
//
//   java -cp <projectzomboid.jar>:<this dir> RealEngine <script.lua> [path ...]
//
// Extra args are Lua search roots for require(). Run from the repo root: Kahlua
// reads the game's stdlib.lua from the working directory (tools/kahlua/run.sh
// copies it in, gitignored - it is game content and is never committed).
//
// Machine-readable lines on stdout, one per fact (tools/realengine/run.sh reads them):
//   RE:BOOT_MS=<n>   RE:TOUCHED=<n>   RE:RESULT=PASS | RE:RESULT=FAIL <message>
import se.krka.kahlua.converter.KahluaConverterManager;
import se.krka.kahlua.j2se.J2SEPlatform;
import se.krka.kahlua.vm.JavaFunction;
import se.krka.kahlua.vm.KahluaTable;
import se.krka.kahlua.vm.KahluaThread;
import se.krka.kahlua.vm.LuaCallFrame;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class RealEngine {
    static int touched = 0;

    public static void main(String[] args) throws Exception {
        if (args.length < 1) { System.err.println("usage: RealEngine <script.lua> [lua-root ...]"); System.exit(2); }
        long t0 = System.currentTimeMillis();
        J2SEPlatform p = new J2SEPlatform();
        KahluaTable env = p.newTable();
        p.setupEnvironment(env);
        KahluaThread t = new KahluaThread(p, env);
        // The game sets these before exposing anything; without them the engine's own
        // static initialisers throw. Each is a place where this boot only APPROXIMATES
        // the real game (see docs/management/REAL_ENGINE_TESTS.md, "what is faked").
        var owner = KahluaThread.class.getDeclaredField("debugOwnerThread");
        owner.setAccessible(true);
        owner.set(t, Thread.currentThread());
        KahluaConverterManager cm = new KahluaConverterManager();
        zombie.Lua.LuaManager.env = env;
        zombie.Lua.LuaManager.platform = p;
        zombie.Lua.LuaManager.thread = t;
        zombie.Lua.LuaManager.converterManager = cm;
        zombie.core.random.RandStandard.INSTANCE.init();
        zombie.ZomboidFileSystem.instance.init();
        zombie.ui.UIManager.defaultthread = t;
        zombie.Lua.LuaManager.debugthread = t;
        zombie.Lua.KahluaNumberConverter.install(cm);
        new zombie.Lua.KahluaArrayConverter(p, cm).install();
        zombie.Lua.LuaManager.Exposer exposer = new zombie.Lua.LuaManager.Exposer(cm, p, env);
        exposer.exposeAll();

        // Helpers the test files use. The real game's require() is not available headless.
        KahluaTable re = p.newTable();
        env.rawset("RE", re);
        String[] roots = new String[args.length - 1];
        System.arraycopy(args, 1, roots, 0, roots.length);
        re.rawset("log", (JavaFunction) (f, n) -> { System.out.println("RE:LOG " + f.get(0)); return 0; });
        re.rawset("touch", (JavaFunction) (f, n) -> { touched++; return 0; });
        re.rawset("readfile", (JavaFunction) (f, n) -> {
            try { f.push(Files.readString(Paths.get(String.valueOf(f.get(0))))); } catch (Exception e) { f.pushNil(); }
            return 1;
        });
        // RE.method("zombie.worldMap.UIWorldMapV2", "getSymbolsAPIv2", 0) -> the declared return type's name,
        // or nil when the real class has no public method of that name taking that many arguments.
        // For calls whose receiver cannot be built headless (a live map window): the contract is still real.
        re.rawset("method", (JavaFunction) (f, n) -> {
            try {
                Class<?> c = Class.forName(String.valueOf(f.get(0)));
                String name = String.valueOf(f.get(1));
                int argc = ((Double) f.get(2)).intValue();
                touched++;
                for (java.lang.reflect.Method m : c.getMethods())
                    if (m.getName().equals(name) && m.getParameterCount() == argc) { f.push(m.getReturnType().getName()); return 1; }
            } catch (ClassNotFoundException e) { /* unknown class: nil */ }
            f.pushNil();
            return 1;
        });
        // RE.isa(child, parent): is the real class `child` a kind of `parent`? (Kahlua dispatches on the
        // runtime class, so a method declared on a subclass is callable through a parent-typed result.)
        re.rawset("isa", (JavaFunction) (f, n) -> {
            try { touched++; f.push(Class.forName(String.valueOf(f.get(1))).isAssignableFrom(Class.forName(String.valueOf(f.get(0))))); }
            catch (ClassNotFoundException e) { f.push(Boolean.FALSE); }
            return 1;
        });
        re.rawset("roots", String.join(";", roots));
        String prelude = new String(Files.readAllBytes(Paths.get(
            Path.of(System.getProperty("re.dir", "tools/realengine"), "prelude.lua").toString())));
        System.out.println("RE:BOOT_MS=" + (System.currentTimeMillis() - t0));

        String result = "PASS";
        try {
            String code = new String(Files.readAllBytes(Paths.get(args[0])));
            Object[] r1 = t.pcall(t.call(env.rawget("loadstring"), new Object[]{prelude, "prelude"}), new Object[0]);
            if (!Boolean.TRUE.equals(r1[0])) throw new RuntimeException("prelude: " + r1[1]);
            Object fn = t.call(env.rawget("loadstring"), new Object[]{code, "@" + args[0]});
            if (fn == null) throw new RuntimeException("could not compile " + args[0]);
            Object[] r = t.pcall(fn, new Object[0]);
            if (!Boolean.TRUE.equals(r[0])) result = "FAIL " + (r.length > 1 ? String.valueOf(r[1]).replace('\n', ' ') : "?");
        } catch (Throwable e) {
            result = "FAIL " + e;
        }
        System.out.println("RE:TOUCHED=" + touched);
        System.out.println("RE:RESULT=" + result);
        System.out.flush();
        System.exit(result.equals("PASS") ? 0 : 1);
    }
}
