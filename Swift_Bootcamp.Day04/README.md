### Hello!

Today we are going to talk about another programming language that is associated with Apple products - ObjectiveC. 
This language was the main tool for developers before Swift came along. 
Of course, the Swift language has many advantages over ObjectiveC:
- Swift is more readable
- Swift is safer
- Swift is faster.
ObjectiveC is used for applications that require backward compatibility. For example, the SwiftUI framework is only supported starting with iOS 13. At the same time, ObjectiveC is suitable for application development regardless of the platform.

This project covers the following topics:
- ObjectiveC and creating objects with it
- ObjectiveC in Swift
- Swift in ObjectiveC
  
## Topics:
- ObjectiveC
- ObjectiveC in Swift
- Swift in ObjectiveC

**Tip!** While doing the task, carefully read the Swift and ObjectiveC documentation. Examples of interactions between different APIs are in [documentation](https://developer.apple.com/documentation/swift/importing-objective-c-into-swift). You can find separate documentation about ObjectiveC [here].(https://developer.apple.com/documentation/objectivec).

### Project: Coffee House 

## Tasks:

**Requirement!** Create a workspace inside the src folder named day04. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day04/quest1, day04/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Coffee house
Create a project with ObjectiveC as the main language.

**Tip!** To get started with Swift and ObjectiveC, study the corresponding example.

The classes `Barista` and `Coffee` must be implemented with the following structure:

**Coffee:**
- Name
- Price

**Barista:**
- Name
- Surname
- Employment history
- Method `brew()` which describes brewing coffee with input parameter of class `Coffee`. When the function is called it must output "Processing brewing coffee...". 

Basic program scenario:
1. The program offers a menu of 3 different types of coffee.
2. The user selects a coffee by number via console input.
3. A barista makes this coffee.
4. The program outputs "Your {$name} is ready!"
5. If you enter invalid data, it outputs "Try again!" and a new input is expected.

_Example:_
```
Choose coffee in menu:
1. Сappuccino 2$
2. Americano 1,5$
3. Latte 2,3$

1

Proccesing brewing coffee...
Your Сappuccino is ready!
```  

### Task 2. Make me some black coffee, machine

As a result of task 1, you have implemented a console barista in the ObjectiveC language.
This task is done in the Swift language.

You need to implement the `BaristaMachine` class in Swift.
The requirements for the `BaristaMachine` class:

- To support the `Barista` class, a common protocol `IBarista` must be specified.
- Contains the coffee machine model name
- Makes coffee using the `brew()` method
- Contains a 300ml coffee preparation time
- During the brewing process the cooking time is displayed on the screen (can be made constant)
For example, `"Coffee is brewing. 1 minute - time left"`.

**Tip!** Study how the compiler generates ObjectiveC files in Swift in Xcode.

You can do this by selecting `Generated Interfaces` in the menu tab of the open file after you have done `Build`.

Basic program scenario:
1. The program offers a choice of a barista - a person or a coffee machine (menu by the number).
2. If the coffee machine is selected, a 10% discount on the entire menu must be applied.
3. The program offers a menu of 3 different types of coffee.
4. The user selects a coffee by number via console input.
5. The selected barista makes this coffee.
6. The program outputs "Coffee is ready!".
7. If you enter invalid data, it outputs "Try again!" and a new input is expected.

_Example:_
```
Choose barista:
1. Man
2. Machine

2

Choose coffee in menu:
1. Сappuccino 1,8$
2. Americano 1,35$
3. Latte 2,07$

1

Coffee is brewing. One minute - time left
Coffee is ready!
```
