### Hello!

Today's project is about asynchronous operations in Swift and IOS applications. 

Asynchronous operations are important in iOS applications because they allow you to perform long tasks in the background without blocking the main thread.

The main thread in iOS is responsible for updating the user interface and interaction with the user. 
If a long task is running in the main thread, this can cause temporary delays in the UI and lead to a poor user experience.

By running long tasks asynchronously, it is guaranteed that the main thread remains free to handle UI updates and user interaction, resulting in a responsive and smooth user experience.

The main frameworks for asynchronous development in iOS are Combine and SwiftRx.
SwiftRx has the best backward compatibility, so it is considered in the course.

## Topics
- async-await
- SwiftRx components(Observable, Single and others)

## Project: asynchronous operations 

## Task:

**Creating a project with dependencies**
To add dependencies to a project, you can use the Swift Packet Manager built into XCode, 
or the dependency manager [Cocoapods](https://cocoapods.org/).
Use the instructions on the project website related to `pod` commands to create a cocoapods project.

You can find examples of projects with SPM and CocoaPods in the `code-samples` folder. 
You need to call the `pod install` command in advance for the project with cocoapods.

**Requirement!** Create a workspace inside the src folder named day05 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day05/quest1, day05/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Function requirements**:
1. All implemented functions must be called at least once in the main function with `await`.
2. The inputs for each function are `firstCollection` and `secondCollection` from the example.
3. If the function is applied to `firstCollection` - the input parameter is Observable from strings,
If to ``secondCollection` - the input parameter is Observable from `Sample`.

### Task 1

- Implement a function that will filter `firstCollection` and save only string with the letter `e`

### Task 2

- Implement a function that will return the first element from the `firstCollection` beginning with `th`

### Task 3

- Implement a function that checks if all strings from the `firstCollection` are longer than `5` characters

### Task 4

- Implement a function that checks if there are any strings longer than `5` characters in the `firstCollection`

### Task 5

- Implement a function that checks for empty strings in the `firstCollection`

### Task 6

- Implement a function that counts the total length of strings in the `firstCollection`

### Task 7

- Implement a function that counts the number of strings in the `firstCollection`

### Task 8

- Implement a function that returns an array of strings (text fields) from the `secondCollection`

### Task 9

- Implement a function that groups values by id in the `secondCollection`

### Task 10

- Implement a function that groups values by id in the `secondCollection` and counts the number of elements in each group. 
Output example listOf(Pair(1, 2), Pair(2, 2), Pair(3, 1)