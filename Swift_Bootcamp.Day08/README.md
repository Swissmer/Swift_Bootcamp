### Hello, everyone!

The goal is to learn about the DI pattern in iOS. 
You will need [SwiInject](https://github.com/Swinject/Swinject) library.

## Topics
- DI
- Swinject
  
### DI in applications
Dependency Injection (DI) is a software design pattern that allows you to manage application component dependencies, segregate responsibility, improve testability and make it easier to maintain code.

DI allows you to abstract the creation of objects from their use, implement dependencies from external sources and manage the life cycle of objects.

Write a program that will consist of stub classes that simulate the execution of queries and methods to save data to the database (i.e. the objects do not work with the network and the database, only return objects predefined in the code).

## Tasks

**Requirement!** Create a workspace inside the src folder named day08 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day08/quest1, day08/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. Create a new project in XCode

### Task 1. Preparing objects for DI

You need to:
 - Create a `User` data class with at least four fields
 - Create a `NetworkService` protocol that has a method to get a list of `User` objects
 - Implement a `NetworkService` protocol with `NetworkServiceImpl` class name , which returns a stub list of predefined objects (a list of filled objects can be created directly in the get method)
 - Create a `DatabaseService` protocol that has a method to save a list of `User` objects
 - Implement a `DatabaseService` protocol with  `ReleaseDatabaseServiceImpl` class name, which outputs the list to the console when saving 
"Release: [user1, user2, ... , userN] were saved"
- Implement a `DatabaseService` protocol with `DebugDatabaseServiceImpl` class name , which outputs a list to the console when saving 
"Debug: [user1, user2, ... , userN] were saved"
- Implement `UserRepository` with a method for updating user data, which uses `NetworkService` and `DatabaseService`. The `NetworkService` returns data, the `DatabaseService` stores data

### Task 2. DI Swinject

All further steps must be done in the **main** function. Each step is a separate function that is called in **main**.

1. Get `UserRepository` object using factory method:
  - Create `Container`
  - Register `NetworkService` with the `NetworkServiceImpl` implementation in it 
  - Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation in it
  - Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in it
  - Get the `UserRepository` object from the `Container` and call the method to update user data
  - Get one more `UserRepository` from `Container`
  - Compare those two `UserRepository` objects and display the result in the console
2. Get `UserRepository` object using named dependencies:
  - Create `Container`
  - Register `NetworkService` with the `NetworkServiceImpl` implementation in it
  - Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation and the **release** name 
  - Register `DatabaseService` with the `DebugDatabaseServiceImpl` implementation and the  **debug** name
  - Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in the `Container` with the **release** name
- Register `UserRepository` with the existing  `NetworkService` and `DatabaseService` in the `Container` with the **debug** name
- Get the `UserRepository` object named **release** from the `Container` and call the method to update the user data
- Get the `UserRepository` object named **debug** from the `Container` and call the method to update the user data
3. Getting a single instance of `UserRepository`:
- Create `Container`
- Register `NetworkService` with the `NetworkServiceImpl` implementation in it
- Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation in it
- Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in it using **scope**, which creates a singleton (a suitable scope should be found in the documentation)
- Get the `UserRepository` object from the `Container` and call the method to update user data
- Get another `UserRepository` from the `Container`
- Compare the two received `UserRepository` objects and output the result to the console

