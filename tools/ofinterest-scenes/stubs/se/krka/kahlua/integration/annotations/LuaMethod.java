// COMPILE-TIME STUB ONLY, never packed into the jar: the game's own
// annotation (projectzomboid.jar) is newer class-file format than javac 17
// reads. Same name, members and retention, so the game's copy is the one
// ZombieBuddy finds at run time.
package se.krka.kahlua.integration.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface LuaMethod {
    String name() default "[unassigned]";
    boolean global() default false;
}
