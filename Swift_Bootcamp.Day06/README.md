### Hello!

Today you will create the first database for your iOS app. 

Cases of applying databases to an application:
- Storing user data: the database can be used to store user data, such as profiles, preferences and user settings.
- Data caching: the application can cache frequently requested data in the local database to improve application performance.
- Offline access: the application may need to store data locally for offline access when there is no Internet connection.
- Synchronization: if the application is connected to a server or a web application, the local database can be used to synchronize data between the application and the server.
- Analytics and reporting: the database can be used to store data for analytics and reporting purposes, such as tracking user behavior and application usage statistics.

There are two main types of databases: relational and non-relational (also known as NoSQL).
A relational database is based on a relational model that organizes data into one or more tables with a predefined schema. Each table has a set of columns, and each row is a record in the table. Relational databases are commonly used when there is a need for complex queries, joins, and data consistency. Examples of popular relational databases used in iOS development are SQLite, MySQL, and PostgreSQL.

A non-relational database, on the other hand, does not use tables or a predefined schema. Instead, it uses a flexible document model or key-value to store data. Non-relational databases are typically used when there is a need for scalability, flexibility and high availability. Examples of popular non-relational databases used in iOS development are Realm, Firebase Realtime Database.

In this task, we suggest using Realm, because this ORM allows cross-platform development.
The advantage of Realm is, among other things, the improved backward compatibility with iOS versions as compared to its analogues.

## Topics
- How to use Realm

### Project: Recipes database

## Tasks:

**Requirement!** Create a workspace inside the src folder named day06 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day06/quest1, day06/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Tip** Before completing the task, see the examples in the official documentation from [Realm](https://realm.io/realm-swift/).

### Task 1: Recipes CRUD
Implement a recipe model for your database.

Create an entity `Recipe` that includes:
- Name
- Step-by-step instructions for cooking in the form of a string
- Link to the picture

**Requirement!**
- You must implement a class `RecipeDataSource` in which CRUD operations (Create, Read, Update, Delete) are defined.
- `RecipeDataSource` must implement a method for searching for a recipe by name.

_Program description:_
- When you run the program, the database is filled with your data.
- The program retrieves the added data from the database and displays them as a list.
- Check the deletion by deleting the first element of the list from the database. Display the whole list of recipes on the screen.
- Check the update in the database by updating the name of the first element in the list.
- Check the search for the recipe by name (the name can be specified in the code). Display the list of results in the console.

### Bonus task 2: Reactive work with the database
Rewrite the interaction with the database using a reactive approach. Use [`RxRealm`](https://github.com/RxSwiftCommunity/RxRealm) library, which is a wrapper for Realm to interact with reactive types.
Rewrite the display of the list of all recipes with `Observable`, which will keep track of all elements of type `Recipe` that are in the database.
The app must work as in the previous task.