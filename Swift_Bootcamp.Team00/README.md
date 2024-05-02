### Hello, everyone!  

Today's goal is to learn how to design an interface using SwiftUI, a modern UI framework that helps
create the most beautiful applications for all Apple platforms.

The main advantages of SwiftUI are its ease of creating layouts for all platforms, the use of reactive components (!) and the management of application themes.

**Tip!** Examples of components and standard use cases were shown at [WWDC22].(https://developer.apple.com/videos/swiftui-ui-frameworks/)


Today we will try out SwiftUI to build the application interface and implement the navigation.

**Tip!** Don't forget to read  [documentation](https://developer.apple.com/documentation/swiftui/), in the case of Apple it is always relevant!

## Topics:
- declarative approach to interface design
- implementation of navigation in the application

### Project: Yummy notes for iOS

Project theme - recipe notebook

### Task 0. Create a new project in XCode

The project is created only once and is used for all subsequent tasks.

### Task 1. Note screen

Implement a View component to display a recipe.
- The note screen must contain a picture of the recipe;
- The picture of the recipe must be in a circular frame
- The note screen must contain the name of the recipe;
- The note screen must contain a step-by-step recipe description;
- The fonts of the name and description of the recipe must be different from each other.

**Tip!** Use Preview for easy editing of your components!

### Task 2: Recipe list screen (Main)
Implement a View component to display a list of recipes.

- The recipe list screen must be displayed when you open the application;
- The recipe list screen must contain a list of available recipes;
- Data of available recipes can be generated both from a local JSON file and via a public API;
- You can select an API from the [list](https://github.com/public-apis/public-apis#food--drink);
- The method of data extraction within the task is not evaluated;
- Each list element must have a title and a picture;
- The picture of the recipe must be in a circular frame.

**Tip! ** You can find an example of a local JSON file [here](./materials/example.json)

### Task 3: Navigation
Implement navigation between recipe list elements and their descriptions using NavigationView.

-Each element in the list must lead to its corresponding screen with a description of the recipe;
-The recipe description screen must receive the id of the corresponding recipe from the recipe list screen;
- The return from the recipe description screen to the previous screen (recipe list screen) must be implemented;
- The return must be to the same place in the recipe list from which the transition to the recipe description was made.
.

**Tip! ** Use LivePreview XCode to debug the navigation.

### Bonus task: Steps of the recipe

Implement a step-by-step description of the recipe using the TabView.

 - The structure of the recipe step must be implemented;
  - The steps must be displayed on the recipe description screen;
  - Each step must be on a separate tab;
  - Navigation between steps must be done by swiping and pressing a button;
  - The button for moving to the next step must be located at the end of the description of the current step.
