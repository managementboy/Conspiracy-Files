---
title: "Lua (language)"
source: "https://pzwiki.net/wiki/Lua_(language)"
source_revision: "https://pzwiki.net/w/index.php?title=Lua_(language)&oldid=1476171"
source_last_edited: "Last modified\n\t\t         This page was last edited on 30 August 2026, at 16:52."
retrieved: "2026-09-15T11:39:36.944Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 44
source_tables: 0
---

# Lua (language)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about the Lua language. For API to learn how to hook to Project Zomboid by using Lua, see [Lua (API)](Lua_API.md).

**Lua** is a language heavily used in **Project Zomboid**. Its knowledge is handy if one plans to do any [modding](../foundations/Modding.md) or just understand how the game works. It must be noted that Project Zomboid doesn't uses the last versions of Lua but instead a modified version of Lua 5.1. The page explains the general knowledge needed of the Lua language to get started in programming in Lua but for specificities regarding the API, see the [Lua (API)](Lua_API.md) page.

<a id="What_is_Lua.3F"></a>

## What is Lua?

Lua is a powerful, fast, surprisingly lovely and simple scripting language. It is easily embedded into Java code (which Project Zomboid is written in) and thus was an ideal choice for the Indie Stone to introduce to the modding community. Lua appeared from the 0.2.0 test versions onwards, resulting in some fantastic mods. Some of the initial mods have gone on to be implemented as part of the vanilla game (Stormy's Reloading Mod, RobertJohnson's Farming Mod and Camping Mod).

<a id="Getting_started"></a>

## Getting started

<a id="Tools"></a>

### Tools

To starting writing in Lua, it is suggested to use a text editor that supports Lua syntax highlighting, and even better a proper IDE to organize your projects and more easily manage files. The most popular and suggested IDE is [Visual Studio Code](../foundations/Visual_Studio_Code.md) due to existing tools that add Project Zomboid Lua support.

<a id="Learning_Lua"></a>

### Learning Lua

Due to its simplicity, Lua is a language easily picked up by both programmers and non-programmers alike. You can find many resources online that can help you learn it a bit better.

Alternatively, you can test some Lua codes by utilizing a Lua interpreter such as OneCompiler. Of course, keep in mind that features beyond the standard Lua 5.1 may not work and some differences can exist with the original Lua 5.1, and of course no access to Project Zomboid's [Lua (API)](Lua_API.md) exists in this outside interpreter.

The following sections will explain in detail the various aspects of Lua that you will need to know to get started with modding Project Zomboid. [Mod optimization](../foundations/Mod_optimization.md) might interest you if you're in need of various tips to make your mods run faster.

It is recommanded to read the article [Mod optimization](../foundations/Mod_optimization.md) to understand how to optimize your mods and make them run faster. Things that are available in Project Zomboid Lua can have important performance impact such as prints or even functions.

<a id="Print"></a>

## Print

The print function is used to output text to the console. This is useful for debugging purposes, as it allows you to see the values of variables and the flow of your code. The print function can take any number of arguments, which will be concatenated together and output to the console. For example:



```text
print("Hello World!") -- Output: Hello World!

-- alternatively
print("Hello", "World!") -- Output: Hello World!
```



This code will output "Hello World!" in the console. In Project Zomboid, this will be displayed in the console window when the game is running in [Debug mode](../foundations/Debug_mode.md) as well as in the [console file](../foundations/Game_files.md).

Printing too much text can slow down the game immensely, see [printing performance impact](../foundations/Mod_optimization.md#Prints_are_the_devil). After printing too much in the console, this can also lead to a major console file size which can be counted in gigabytes.

<a id="Variables"></a>

## Variables

Variables are used to store data that can be accessed and modified throughout your code. Variables can store a variety of data types, such as numbers, strings, and tables. Variables in Lua are dynamically typed, meaning that you do not need to specify the type of a variable when you declare it. For example:



```text
local x = 10 -- x is a number
local y = "Hello" -- y is a string
local z = {1, 2, 3} -- z is a table
```



Variables can also reference other variables, including entries in tables. This allows you to create complex data structures and relationships between variables. For example:



```text
local person = {name = "John", age = 30}
local name = person.name -- name now references the name entry in the person table
local age = person.age -- age now references the age entry in the person table
```



In this example, the`person` table contains two entries:`name` and`age`. The variables`name` and`age` are then assigned the values of the corresponding entries in the`person` table. This allows you to easily access and manipulate the data stored in the table.

<a id="Local_and_global"></a>

### Local and global

Variables can be declared as local or global. Local variables are only accessible within the scope in which they are declared, while global variables are accessible throughout Project Zomboid. For example:



```text
-- global variable
x = 10

-- local variable
local y = 20
```



In this example,`x` is a global variable, while`y` is a local variable. Global variables can be accessed and modified from anywhere, while local variables are only accessible within the scope in which they are declared such as the core of your file or within [#Functions](Lua_language.md#Functions), [#For loops](Lua_language.md#For_loops), [#While loops](Lua_language.md#While_loops), [#Repeat until](Lua_language.md#Repeat_until) and [#Do end block](Lua_language.md).

It is recommended to use local variables as much as possible to avoid polluting the global scope of your file. This will help you avoid conflicts with other mods and the game itself. If you need to access variables defined in a file from another file, use [#Modules](Lua_language.md#Modules).

<a id="Data_types"></a>

### Data types

Lua has several data types that can be stored in variables. The most common data types are numbers, strings, and tables. Numbers can be integers or floating-point numbers, strings are sequences of characters enclosed in quotes, and tables are collections of key-value pairs. For example:



```text
local x = 10 -- number
local y = 3.14 -- number
local name = "John" -- string
local numbers = {1, 2, 3, 4, 5} -- table
```



You can check the type of a variable using the`type` function. For example:



```text
local x = 10
print(type(x)) -- Output: number

local name = "John"
print(type(name)) -- Output: string

local numbers = {1, 2, 3, 4, 5}
print(type(numbers)) -- Output: table
```



<a id="Arithmetic_operators"></a>

### Arithmetic operators

Lua supports several arithmetic operators that can be used to perform mathematical operations on numbers. The most common arithmetic operators are addition (+), subtraction (-), multiplication (*), division (/), and modulus (%). For example:



```text
local x = 10
local y = 20
local sum = x + y -- sum is 30
local difference = x - y -- difference is -10
local product = x * y -- product is 200
local quotient = x / y -- quotient is 0.5
local remainder = x % y -- remainder is 10
```



<a id="Precedence_and_associativity"></a>

### Precedence and associativity

Arithmetic operators in Lua follow the standard rules of precedence and associativity. Operators with higher precedence are evaluated before operators with lower precedence. Operators with the same precedence are evaluated from left to right. For example:



```text
local result = 10 + 20 * 2 -- result is 50
```



In this example, the multiplication operator (*) has higher precedence than the addition operator (+), so it is evaluated first. The result is then added to 10 to get the final result of 50.

<a id="Boolean_operators"></a>

### Boolean operators

Lua also supports boolean operators that can be used to perform logical operations on boolean values. The most common boolean operators are`and`,`or`, and`not`. For example:



```text
local x = true
local y = false
local result = x and y -- result is false
result = x or y -- result is true
result = not x -- result is false
```



`false` and`nil` are considered as false in Lua, while`true` and any other value are considered as true.

<a id="Relational_operators"></a>

### Relational operators

Lua supports several relational operators that can be used to compare values. The most common relational operators are`==` (equal),`~=` (not equal),`<` (less than),`>` (greater than),`<=` (less than or equal to), and`>=` (greater than or equal to). For example:



```text
local x = 10
local y = 20
local result = x == y -- result is false
result = x ~= y -- result is true
result = x < y -- result is true
result = x <= y -- result is true
result = x > y -- result is false
result = x >= y -- result is false
```



<a id="Length_operator"></a>

### Length operator

The length operator`#` can be used to get the length of a string or the number of elements in a table. For example:



```text
-- string
local name = "John"
print(#name) -- Output: 4

-- table
local numbers = {1, 2, 3, 4, 5}
print(#numbers) -- Output: 5
```



This operator will not count keys-values in a table, but only the values in an array-like table.

<a id="Tables"></a>

## Tables

Tables are a fundamental data structure in Lua that can be used to store and organize data. Tables can store a variety of data types, including numbers, strings, and other tables. Tables can be indexed by keys, which can be strings, numbers, or other data types, or act as pseudo arrays. For example:



```text
-- key-value table
local person = {name = "John", age = 30}
print(person.name) -- Output: John
print(person.age) -- Output: 30

-- array like table
-- they are 1-indexed, meaning the first element is at index 1, not 0 like other languages
local numbers = {1, 2, 3, 4, 5}
print(numbers[1]) -- Output: 1
print(numbers[2]) -- Output: 2

-- nested tables
local person = {name = "John", address = {city = "New York", country = "USA"},}
print(person.address.city) -- Output: New York
print(person.address.country) -- Output: USA
```



Tables can be used to store and organize data in a structured way, making it easier to access and manipulate the data. Tables can also be used to represent complex data structures and relationships between data.

All tables are technically key-tables which is why "arrays" (`{5,6,"hello"}`) are pseudo-arrays. This makes them more costly than actual arrays but it is possible to create true arrays by using the`table.newarray()` function (see [proper array tables](../foundations/Mod_optimization.md#Array_tables)).

<a id="Inserting_values_into_tables"></a>

### Inserting values into tables

You can insert new values inside a table in two different ways. The first way is to use the`table.insert` function, which allows you to insert a value inside an array-like table:



```text
local numbers = {1, 2, 3, 4, 5}
table.insert(numbers, 6) -- insert 6 at the end of the table
```



A more efficient way of doing this is to directly assign a value to the next index of the table:



```text
local numbers = {1, 2, 3, 4, 5}
numbers[#numbers + 1] = 6 -- #numbers equals 5, so 5+1 inserts the new value right after the last value in the table
```



The other way to insert values is for a key-value table, which is done by directly assigning a value to a key in the table:



```text
local person = {name = "John", age = 30}
person.address = "New York" -- insert a new key-value pair into the table
print(person.address) -- Output: New York
```



Technically, both table types can be mixed, but it is not recommended to do so, and instead you should have separate tables for each type of data structure.



```text
local mixedTable = {1, 2, 3, name = "John", age = 30}
```



<a id="Table_Iteration"></a>

### Table Iteration

Tables can be iterated over using the`pairs` and`ipairs` functions. The`pairs` function iterates over the key-value pairs in a table, while the`ipairs` function iterates over the values in a table with integer keys. For example:



```text
-- pairs
local person = {name = "John", age = 30}
for key, value in pairs(person) do
    print(key, value)
end

-- ipairs
local numbers = {1, 2, 3, 4, 5}
for index, value in ipairs(numbers) do
    print(index, value)
end
```



`pairs` will actually also iterate over integer keys, but it will not guarantee the order of the iteration.

`ipairs` and`pairs` are performance heavy, see [pairs and ipairs optimization](../foundations/Mod_optimization.md#pairs_and_ipairs).

For arrays, it is recommended to not use any of these functions and instead use a simple for loop using the [table size](Lua_language.md#Length_operator).



```text
local numbers = {1, 2, 3, 4, 5}

-- we manually retrieve the values
for i = 1, #numbers do
    local value = numbers[i]
    print(i, value)
end
```



<a id="Lookup_tables"></a>

### Lookup tables

Lookup tables are tables that are used to map keys to values. They can be used to store data that can be accessed quickly and efficiently. They can notably be extremely efficient when needing to check for specific values or associations, providing a fast way to retrieve corresponding values on conditions. Lookup tables can also be used to emulate basic support for enums in Lua. For example:



```text
-- Access a color based on its name, like an enum!
local colors = {
    RED = "FF0000",
    GREEN = "00FF00",
    BLUE = "0000FF"
}

print(colors.RED) -- Output: FF0000
-- or
print(colors["RED"]) -- Output: FF0000

-- alternatively, you can access the color using a variable
local color = "GREEN"
print(colors[color]) -- Output: 00FF00

-- checking an entry not in the table
local invalidColor = "YELLOW"
print(colors[invalidColor]) -- Output: nil
```





```text
-- supposing zombie is an IsoZombie instance
local health = math.floor(zombie:getHealth())

-- BAD
local status
if health == 0 then
    status = "Dead"
elseif health == 1 then
    status = "Dying"
elseif health == 2 then
    status = "Injured"
elseif health == 3 then
    status = "Healthy"
end

-- BETTER
local healthStatus = {
    [0] = "Dead",
    [1] = "Dying",
    [2] = "Injured",
    [3] = "Healthy"
}
local status = healthStatus[health]

print("Health status:", status or "Unknown") -- Output the health status
```



<a id="Functions"></a>

## Functions

Functions are blocks of code that can be called and executed at any point in your program. Functions can take arguments, perform operations, and return values. Functions in Lua are first-class citizens, meaning that they can be assigned to variables, passed as arguments to other functions, and returned from other functions. For example:



```text
-- function definition
local function add(a, b)
    return a + b
end

-- function call
local result = add(10, 20)
print(result) -- Output: 30

-- alternative syntax, write in a variable the function
local multiply = function(a, b)
    return a * b
end
```



Functions can be defined using the`function` keyword, followed by the function name, a list of arguments in parentheses, and the function body. Functions can return values using the`return` keyword, followed by the value to be returned. Functions can be called by using the function name followed by a list of arguments in parentheses.

Functions can also be assigned to variables, passed as arguments to other functions, and returned from other functions. This allows you to create higher-order functions that can manipulate and compose other functions.

Functions overhead can be performance heavy, see [functions optimization tips](../foundations/Mod_optimization.md).

<a id="Decoration"></a>

### Decoration

Decorating a function (also known as hooking) is a way to add additional functionality to a function without modifying its original code. This can be done by wrapping the function in another function that adds the desired functionality. For example:



```text
-- original function
local function add(a, b)
    return a + b
end

-- decorate the function
local original_add = add

-- decorate to run code before the original function
local function add(a, b)
    print("Adding", a, "and", b) -- extra action, will run before the original function
    return original_add(a, b)
end

-- decorate to run code after the original function
local function add(a, b)
    local result = original_add(a, b)
    print("Result is", result) -- extra action, will run after the original function
    return result
end

-- decorate function to run different behavior based on input
local function add(a, b)
    -- don't run the addition if one of the arguments is 0
    if a == 0 then
        return b
    elseif b == 0 then
        return a
    end

    return original_add(a, b)
end
```



This can be applied to any functions defined by the game or by other mods to add additional functionality without modifying the original code. It is **HIGHLY** recommended to use this method to avoid conflicts with other mods if you don't purely need to overwrite base functionalities.

<a id="Nil"></a>

## Nil

The`nil` value is used to represent the absence of a value. Variables that have not been assigned a value are automatically set to`nil`. For example:



```text
local x
print(x) -- Output: nil
```



`nil` can also be used to remove a value from a variable. For example:



```text
local x = 10
print(x) -- Output: 10

x = nil
print(x) -- Output: nil
```



`nil` is counted as falsy in Lua, meaning that it is considered as false in boolean expressions.



```text
local x = nil
if x then
    print("x is true")
else
    print("x is false") -- Output: x is false
end

-- alternatively
if not x then
    print("x is false") -- Output: x is false
end
```



However, it is important to note that`nil` is not the same as`false` (`nil ~= false`).`nil` is used to represent the absence of a value, while`false` is a boolean value that represents false.

<a id="Nil_and_tables"></a>

### Nil and tables

You can remove a value in a key-table by setting it to`nil`. This will remove the key-value pair from the table. For example:



```text
local person = {name = "John", age = 30}
print(person.name) -- Output: John

person.name = nil
print(person.name) -- Output: nil
```



However doing that to an array-like table will break`ipairs`. It will also break`#`.



```text
tbl = {
  "Hello",
  "World",
  "!",
}

print(#tbl) -- Output: 3
for i,v in ipairs(tbl) do
    print(i,v) -- Output: 1, Hello, 2, World, 3, !
end

tbl[2] = nil -- remove the second value

-- ipairs and # iterate over the table until it finds a nil value, so it will stop at the first value and not print the second and third one
print(#tbl) -- Output: 1
for i,v in ipairs(tbl) do
    print(i,v) -- Output: 1, Hello
end

-- however the values after 2 are still there, like demonstrated by this example here
tbl[2] = "modders"

print(#tbl) -- Output: 3
for i,v in ipairs(tbl) do
    print(i,v) -- Output: 1, Hello, 2, modders, 3, !
end
```



`pairs` on the other hand will not break and will iterate over all the values in the table. To remove values from an array-like table, it is recommended to use`table.remove` instead as this will move every subsequent element down in the array, maintaining the integrity of the indices and allowing`ipairs` and`#` to work as intended.

<a id="For_loops"></a>

## For loops

For loops are used to iterate over a sequence of values and perform operations on each value. For loops in Lua can be used to iterate over arrays, tables, and other sequences of values. For example:



```text
-- repeat a number
for i = 1, 5 do
    print(i) -- Output: 1, 2, 3, 4, 5
end

-- repeat a number with a step
for i = 1, 10, 2 do
    print(i) -- Output: 1, 3, 5, 7, 9
end

-- repeat a number in reverse
for i = 5, 1, -1 do
    print(i) -- Output: 5, 4, 3, 2, 1
end
```



For loops in Lua can be used to iterate over a range of values, with an optional step value. For loops can also be used to iterate over arrays, tables, and other sequences of values as seen in [#Tables](Lua_language.md#Tables). For loops can be used to perform operations on each value in the sequence.

`break` can be used to exit a loop early, while`continue` can be emulated by using [#Repeat until](Lua_language.md#Repeat_until) blocks.



```text
for i = 1, 5 do
    repeat
        if i == 3 then
            break
        end
        print(i) -- Output: 1, 2, 4, 5
    until true
end
```



<a id="Custom_iterators"></a>

### Custom iterators

You can create custom iterators in Lua by defining a custom iterator function.`ipairs` is a built-in iterator function with the following shape:



```text
local function ipairs_iterator(t, index)
    local nextIndex = index + 1
    local nextValue = t[nextIndex]
    if nextValue ~= nil then
        return nextIndex, nextValue
    end
end

function ipairs(t)
    return ipairs_iterator, t, 0
end
```



In the same way, you can make a custom iterator function:



```text
function my_iterator(t, index)
    local nextIndex = index + 1
    local nextValue = t[nextIndex]
    if nextValue ~= nil then
        -- make sure that every numbers are doubled
        if type(nextValue) == "number" then
            nextValue = nextValue * 2
        end
        return nextIndex, nextValue
    end
end
```



When the iterator function returns`nil`, the iteration stops.

<a id="While_loops"></a>

## While loops

While loops are used to repeat a block of code while a condition is true. While loops in Lua can be used to repeat a block of code until a condition is false. For example:



```text
local i = 1
while i <= 5 do
    print(i) -- Output: 1, 2, 3, 4, 5
    i = i + 1
end
```



While loops in Lua can be used to repeat a block of code until a condition is false. It is however **not recommended** to use while loops without properly knowing what you are doing as they can easily lead to infinite loops which will make the game stuck and crash.

`break` can be used here too, as well as the continue trick used in [#For loops](Lua_language.md#For_loops).



```text
local i = 1
while i <= 5 do
    repeat
        if i == 3 then
            break
        end
        print(i) -- Output: 1, 2, 4, 5
    until true
    i = i + 1
end
```



<a id="Repeat_until"></a>

## Repeat until

Repeat until loops are used to repeat a block of code until a condition is true. Repeat until loops in Lua can be used to repeat a block of code until a condition is true. For example:



```text
local i = 1
repeat
    print(i) -- Output: 1, 2, 3, 4, 5
    i = i + 1
until i > 5
```



Repeat until loops in Lua can be used to repeat a block of code until a condition is true. It is recommended to use repeat until loops instead of while loops when you want to ensure that the block of code is executed at least once.

`break` can be used to stop the loop early.

Repeat until can be used to create a continue-like behavior in other types of loop like [#For loops](Lua_language.md#For_loops) and [#While loops](Lua_language.md#While_loops).



```text
for i = 1, 5 do
    repeat
        if i == 3 then
            break
        end
        print(i) -- Output: 1, 2, 4, 5
    until true
end
```



<a id="Conditional_statements_.28if.29"></a>

## Conditional statements (if)

Conditional statements are used to execute different blocks of code based on the value of a condition. Conditional statements in Lua can be used to execute different blocks of code based on the value of a condition. For example:



```text
local x = 10
if x > 5 then
    print("x is greater than 5") -- Output: x is greater than 5
elseif x < 5 then
    print("x is less than 5") -- Not reached
else
    print("x is equal to 5") -- Not reached
end
```



Conditional statements in Lua can be used to execute different blocks of code based on the value of a condition. Conditional statements can be used to create branching logic in your code, allowing you to handle different cases and scenarios. But for this last case, you can utilize key-value tables to create a switch-case like structure.

<a id="Switch-case_using_tables"></a>

## Switch-case using tables

Lua does not have a built-in switch-case statement like some other languages, but you can achieve similar functionality using key-value tables. For example:



```text
local actions = {
    greet = function()
        print("Hello!")
    end,
    farewell = function()
        print("Goodbye!")
    end,
    default = function()
        print("Unknown action")
    end
}

-- greet case
local action = "greet"
local func = actions[action] or actions.default
func() -- Output: Hello!

-- farewell case
action = "farewell"
func = actions[action] or actions.default
func() -- Output: Goodbye!

-- default use example
action = "unknown"
func = actions[action] or actions.default
func() -- Output: Unknown action
```



In this example, the`actions` table contains functions for different actions. The`action` variable is used to look up the corresponding function in the`actions` table. If the action is not found, the`default` function is used. This allows you to create a switch-case like structure using tables.

<a id="Do_end_blocks"></a>

## Do end blocks

Do end blocks are used to create a block of code that can be executed as a single unit. For example:



```text
do
    local x = 10
    local y = 20
    local sum = x + y
    print(sum) -- Output: 30
end
```



However this block is mostly used to limit the scope of variables and functions. This is useful to avoid polluting the global scope of your file with variables that are only used in a specific block of code.

<a id="Modules"></a>

## Modules

Modules are used to organize and encapsulate code into reusable units. Modules in Lua can be used to organize and encapsulate code into reusable units. Modules can contain functions, variables, and other data that can be accessed and used by other parts of your code. For example:



```text
--- mymodule.lua

-- module definition
local M = {}

-- module function
function M.add(a, b)
    return a + b
end

-- module variable
M.PI = 3.14159

return M
```



Modules can be used to access code which was defined locally in another file. This is useful to separate your code into different files and keep your code organized and [eliminate the use of globals](../foundations/Mod_optimization.md). Modules can be loaded using the`require` function, which will load and execute the module code. For example:



```text
--- main.lua

-- load module
local mymodule = require("mymodule")

-- use module function
local result = mymodule.add(10, 20)
print(result) -- Output: 30

-- use module variable
print(mymodule.PI) -- Output: 3.14159
```



<a id="String_manipulation"></a>

## String manipulation

Strings are used to store and manipulate text data. Strings in Lua can be used to store and manipulate text data. Strings can be concatenated using the`..` operator. For example:



```text
local name = "John"
local age = 30
local message = "Hello, " .. name .. "! You are " .. age .. " years old."
print(message) -- Output: Hello, John! You are 30 years old.
```



`tostring(variable)` can be used to transform a variable into a string. This works for all types of variables such as Java objects.



```text
local number = 10
local string = tostring(number)
print(string) -- Output: 10
```



The string library of Lua is very powerful and can be used to manipulate strings in many ways. For example, you can use the`string.upper` function to convert a string to uppercase, the`string.lower` function to convert a string to lowercase, and the`string.sub` function to extract a substring from a string.

You can also format strings using the`string.format` function, which allows you to create formatted strings with placeholders for variables. For example:



```text
local name = "John"
local age = 30
local message = string.format("Hello, %s! You are %d years old.", name, age)
print(message) -- Output: Hello, John! You are 30 years old.
```



This can even be used alongside [Translation](../translations/Translation.md) files to have dynamic text translated in different language.

<a id="Tips_and_tricks"></a>

## Tips and tricks

- Check [Mod optimization](../foundations/Mod_optimization.md) to learn how to optimize your mods and make them run faster.

<a id="Readability"></a>

### Readability

- Ask yourself if you read your code in a year, would you understand it? If not, you should improve it's readability.
- Use proper indentation to make your code more readable.
- Use descriptive variable and function names to make your code easier to understand.
- Use comments to explain your code and document your functions.
- Limiting making nested indentation is suggested. You can use guard clauses to avoid them:



```text
if condition then
    -- do stuff         <--- this adds an indentation level
end

-- instead do this
if not condition then return end

-- do stuff             <--- one less indentation level
```



<a id="See_also"></a>

## See also

- [external destination omitted] - a guide to learning Lua
- [external destination omitted] - an online Lua compiler

Retrieved from "[https://pzwiki.net/w/index.php?title=Lua_(language)&oldid=1476171](Lua_language.md)"
