#### Hello, student! This is your first project in Swift

Today's goal is to learn the basic functions of the Swift language, which is one of the most famous development languages used in Apple devices.

**Swift** is an open-source programming language developed by Apple and intended for developing applications for the company's OS ecosystem. However, from time to time, it can also be used for other projects.

Swift's main advantages:
- Readability: the syntax of the language stands out from other languages, which makes writing and reading code easier.
- Performance: Swift is faster than Objective-C and is designed for high performance, making it suitable for developing high-load applications.
- Security: Swift has rich tools for type casting and error handling, which helps developers write safe and more secure code.

Here are some of the features of the language that make it a powerful and handy tool:
- Optional
- Extensions
- Built-in template functions such as map, filter, etc.
- Structs that support methods, extensions and protocols
- Extended control with special constructions as do, guard, defer, and repeat

# Topics
Now, we're going to learn the fundamentals of language, remember how basic things work, and stretch our fingers. Main topics:
- Data types
- Operators, loops and conditions
- Use of arguments in a program

[Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/)

### Project: Smart calculator 
The basic functions of the language are covered using the project, which is a set of tools for solving different types of tasks.

# Tasks

**Attention!** We will use Workspace to create projects throughout the Intensive. 
It will help you conveniently keep several projects in one day.

**Requirement!** Create a workspace inside the src folder named day00. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day00/quest1, day00/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. New project

You can see an example project in the `code-samples` folder.

- Select File -> New -> Workspace
- Select File -> New -> Project -> macOS -> Command line tool 
(In `Add to:` specify the created workspace, also the project must be located inside the code-samples folder)

Success! Your journey into Swift has begun!

### Task 1. Crop circles
Develop a math module that determines whether circles intersect.

- Two circles on the coordinate plane: the first with center at the point (x1, y1) with radius r1, the second with center at the point (x2, y2) with radius r2.
- The program reads the coordinates and radius one by one using the command line. 
- The program works with real numbers.
- The program determines if the circles intersect and outputs this as the result (touch is also considered an intersection). If one circle is inside another, output "One circle is inside another". See the example below.
- The program does not stop with an error if the input data is not correct. It outputs "Couldn't parse a number. Please try again" and retries entering the parameter.

| Input data | Output data |
| ------ | ------ |
| 0.0<br/>  0.0 <br/> 3.0 <br/> 4.0 <br/> 4.0 <br/> 3.0 <br/> | The circles intersect |
| 2.0<br/>  2.0 <br/> 3.0 <br/> 1.0 <br/> 1.0 <br/> 1.0 <br/> | One circle is inside another |
| 4.0<br/> 4.0 <br/> 4.0 <br/> -4.0 <br/> -10.0 <br/> 1.0 <br/> | The circles is not intersect |


### Task 2. Composing of numbers
Develop a module to compose numbers according to a user-defined number.

- The program sequentially composes numbers from neighboring digits in a user-defined number and displays them on the screen. For example, 123, when considered from higher order to lower order, 3 numbers will be output - 1, 12 and 123.
- The user chooses the order in which the number is considered: lower order (from lower to higher) or higher (from higher to lower order).  For example, at lower the result for 1022 will be numbers - 2, 22, 220, 2201; at higher - 1, 10, 102, 1022.
- The composed number must be a part of the given number, starting with the first digit of the given one or its inverted version when considered from lower order to higher order (lower).

The program works with integer values of `Int` type and stops when input variables are incorrect. It should throw any error to stop the program, such as `throw Exception("message")`.

| Input data | Output data |
| ------ | ------ |
| lower<br/> 352 | 3 <br/> 35 <br/> 352 |
| higher<br/> -352 | -2 <br/> -25 <br/> -253
| higher<br/> 1000 | 0 <br/> 0 <br/> 0 <br/> 1


### Task 3. Thermometer 
The most comfortable temperature for humans varies depending on the season: from 22 to 25°C in summer and from 20 to 22°C in winter. Write a program that, given the current season, determines and outputs the comfortable temperature and the difference from the current temperature.
- The temperature sensor operates on a Celsius scale. The inputs are integer numbers.
- The program can output results in three scales: Celsius, Kelvin and Fahrenheit. The input data must be specified in degrees Celsius only.
- The program does not stop with an error if the input data are not correct. Instead, it must display an error message and suggest re-entering the data. For example, "Incorrect input. Enter a temperature:".
- Additionally, the program offers to adjust the temperature if it does not meet the comfortable values.
- Data entry order:
  1. temperature measurement scale, which will be used by the program for the output values;
  2. season (S for summer, W for winter);
  3. current temperature in degrees Celsius.

| Input data | Output data |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees.|
| Fahrenheit<br/>  S <br/> 22 <br/>  | The temperature is 71,6 F <br/> The comfortable temperature is from 71,6 to 77 F. <br/>The temperature is comfortable. |

### Task 4. Too wet
Let's add the humidity value processing for the previous task.

The comfortable humidity for humans is from 30% to 60% in summer and from 30% to 45% in winter. In task 4 you need to add the parameters of the comfortable humidity for both seasons. After specifying the temperature, you must enter the humidity value and determine if it is comfortable. If the humidity is not meeting the requirements, then advise to decrease or increase it by a certain percentage.

| Input data | Output data |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/> 35 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees. <br/> The comfortable humidity is from 30% to 60% <br/>The humidity is comfortable|


### Bonus task 5. Crop circles - 2
Extend the functionality of the first task. If the circles touch or intersect, output the coordinates of the touch and intersection points.

| Input data | Output data |
| ------ | ------ |
| 0.0 <br/>  1.0 <br/> 1.0 <br/> 2.0 <br/> 1.0 <br/> 1.0 <br/> | The circles intersect <br/> [ [1.0, 1.0] ]|

### Bonus Task 6. Speech module
**Requirement!** Do not use ready-made solutions to convert numerical values to their corresponding text.

As a child, many people who love sci-fi and mechanisms dreamed of a device that could understand words, accept voice commands and perform corresponding actions. Now voice control has become a familiar format of communication with the computer, making our lives easier and making this communication more natural. Our smart calculator certainly needs an intermediary module that translates recognized speech into a language that the computer can understand.

Develop a speech module that reads integers in numeric format and translates them into numbers in words.
- The module must accept numbers up to and including a million (positive and negative)
- The module receives an integer number in numeric format and types it in English words. This means that a set of words separated by a hyphen makes a number. Example: one-hundred-two
- The number I/O process is repeated until the user types "exit".
- At the start, before entering, the module prints "The program is running. Enter a number or type "exit" to stop:"
- On the second number and further, before entering, the module displays "Enter a number:"
- Every 5th iteration, before entering, the module prints "Enter a number or type "exit" to stop:"
- If incorrect data (a word, a character or an unsupported number) are entered, the module outputs "Incorrect format, try again.\nEnter a number:" or "The number is out of bounds, try again.\nEnter a number:" and waits for another input

_Example_
```
The program is running. Enter a number or type "exit" to stop:
yes
Incorrect format, try again

Enter a number:
34
thirty-four

Enter a number:
exit

Bye!
```


