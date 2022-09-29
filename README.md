# Overview

The code in this Repo mainly demonstrates the basics of Lua, aiming to master Lua's language features and basic applications. This code is writen in free and spare time and all based on my own experience and mainly refer to Lua official documents. Readers will benefit a lot from reading step by step.

## Basic1

### Variable

- Global variables
- Local variables
- Table fields

### Type

+ nil

  > Nil is a type with a single value, **nil**, whose main property is to be different from any other value.

+ boolean

  > The boolean type has two values, **false** and **true**

+ number

  > The number type represents real (double-precision floating-point) numbers.

+ string

  > Strings have the usual meaning: a sequence of characters.

+ function

  > Functions are first-class values in Lua. That means that functions can be stored in variables, passed as arguments to other functions, and returned as results.

+ userdata&thread

  > The userdata type allows arbitrary C data to be stored in Lua variables. 

+ table

  > The table type implements associative arrays.

### Operator

- Arithmetic Operators

  > Lua supports the usual arithmetic operators: the binary ``+`´ (addition), ``-`´ (subtraction), ``*`´ (multiplication), ``/`´ (division), and the unary ``-`´ (negation).

- Relational Operators

  > Lua provides the following relational operators: <   >   <=  >=  ==  ~=

- Logical Operators

  > The logical operators are **and**, **or**, and **not**. 

- Misc Operators

  - `..` -- Concatenates two strings.
  - `#` -- An unary operator that return the length of the a string or a table.

### Statements

+ Local Variables and Blocks
+ If Else

+ Loop
  + for loop
  + while loop
  + repeat until loop

### Functions

+ Multiple Results

  > An unconventional, but quite convenient feature of Lua is that functions may return multiple results. 

+ Variable Number of Arguments

  > Some functions in Lua receive a variable number of arguments.
  > When this function is called, all its arguments are collected in a single table.

+ Named Arguments

  > The parameter passing mechanism in Lua is *positional*

+ Clousure

  > When a function is written enclosed in another function, it has full access to local variables from the enclosing function

+ Non-Global Functions

  > An obvious consequence of first-class functions is that we can store functions not only in global variables, but also in table fields and in local variables.

+ Proper Tail Calls

  > A *tail call* is a kind of goto dressed as a call. A tail call happens when a function calls another as its last action, so it has nothing else to do.

### Iterator

+ Iterators and Closures

  > An *iterator* is any construction that allows you to iterate over the elements of a collection. In Lua, we typically represent iterators by functions: Each time we call that function, it returns a "next" element from the collection.

+ The Semantics of the Generic for

  > One drawback of those previous iterators is that we need to create a new closure for each new loop.

+  Stateless Iterators

  > As the name implies, a stateless iterator is an iterator that does not keep any state by itself. Therefore, we may use the same stateless iterator in multiple loops, avoiding the cost of creating new closures.

+ Iterators with Complex State

  > Frequently, an iterator needs to keep more state than fits into a single invariant state and a control variable. The simplest solution is to use closures. An alternative solution is to pack all it needs into a table and use this table as the invariant state for the iteration.

### Error Handling

> Because Lua is an extension language, frequently embedded in an application, it cannot simply crash or exit when an error happens.

- Syntax errors
- Run time errors

### Coroutines 

> A *coroutine* is similar to a thread (in the sense of multithreading): a line of execution, with its own stack, its own local variables, and its own instruction pointer; but sharing global variables and mostly anything else with other coroutines. 



# Refer

+ [Lua5.1 Reference](https://www.lua.org/manual/5.1/)
