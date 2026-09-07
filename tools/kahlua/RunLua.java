// Run a Lua file through the interpreter Project Zomboid actually uses.
//
// PUC Lua 5.1 is not the engine. Kahlua is an incomplete Lua 5.1, so syntax and
// standard-library calls that pass offline can still fail in game. This runner
// executes a script under the real thing, using the Kahlua bundled inside
// projectzomboid.jar.
//
// Usage: java -cp <projectzomboid.jar>;<this dir> RunLua <script.lua> [args...]
import se.krka.kahlua.j2se.J2SEPlatform;
import se.krka.kahlua.luaj.compiler.LuaCompiler;
import se.krka.kahlua.vm.KahluaTable;
import se.krka.kahlua.vm.KahluaThread;
import se.krka.kahlua.vm.LuaClosure;
import se.krka.kahlua.vm.Platform;
import java.io.FileInputStream;
import java.io.InputStream;

public class RunLua {
    public static void main(String[] args) throws Exception {
        if (args.length < 1) {
            System.err.println("usage: RunLua [--parse] <script.lua> [more.lua ...]");
            System.exit(2);
        }
        // --parse compiles with the engine's own compiler without running the
        // script. PUC Lua accepting a file proves nothing about whether Kahlua
        // will parse it, and a parse error only shows up in game otherwise.
        if (args[0].equals("--parse")) {
            Platform p = new J2SEPlatform();
            KahluaTable e = p.newEnvironment();
            int bad = 0;
            for (int i = 1; i < args.length; i++) {
                try (InputStream in = new FileInputStream(args[i])) {
                    LuaCompiler.loadis(in, args[i], e);
                } catch (Throwable t) {
                    bad++;
                    System.out.println("PARSE FAIL " + args[i]);
                    System.out.println("    " + t);
                }
            }
            System.out.println("kahlua parse: " + (args.length - 1 - bad) + " ok, " + bad + " failed");
            System.exit(bad == 0 ? 0 : 1);
        }
        Platform platform = new J2SEPlatform();
        KahluaTable env = platform.newEnvironment();
        KahluaThread thread = new KahluaThread(platform, env);
        try (InputStream in = new FileInputStream(args[0])) {
            LuaClosure closure = LuaCompiler.loadis(in, args[0], env);
            thread.call(closure, null, null, null);
        } catch (Throwable t) {
            System.err.println("KAHLUA FAILURE in " + args[0]);
            t.printStackTrace(System.err);
            System.exit(1);
        }
    }
}
