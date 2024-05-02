### Hello!  

Today we are going to develop a project using the features of the object-oriented language paradigm.
Swift implements the classic single-root inheritance model and the ability to implement multiple behavior interfaces using protocols.
A very important feature of Swift is the Optional type and operators to interact with it. It allows you to write safe code and practically avoid exceptions related to the use of empty objects.

The language developers also offer some handy tools from this field:
- Structures
- Extensions

Extensions deserve special attention. They allow you to extend a class or interface with new features without having to inherit or use templates such as Decorator.

# Topics:
- OOP, classes, protocols, files, getter/setter
- Optional variables
- Extensions
- Errors

[Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

### Project: Rescue Service
The city is divided into several zones, each with its own rescue squad. Today we are going to develop features for an emergency mobile app. It will handle 2 main requests: to get complete information about a particular zone and to understand if there are accidents.

## Tasks

**Requirement!** Create a workspace inside the src folder named day01. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day01/quest1, day01/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

There is an `example.swift` file in `code-samples` folder with example constructions for today's task.


### Task 1. Rescue Service
Find out if there is an accident in a given zone.
#### Accident description:
- The accident is described using two integer coordinates on the coordinate plane
- The accident has:
  - Description
  - Applicant number - can be nil
  - Field describing one of the three types of accident (e.g., fire, gas leak, cat on the tree) - can be nil
  
**Tip!** Use Enum to enumerate types, e.g. - accident types

#### Zone description:  
- The zone has a quadrangular, triangular or circular shape, representing the figures on the coordinate plane.
- Each zone has:
  - Phone number
  - Name
  - Department Service Code
  - The level representing the probability of an accident (low, medium, high)
- The zone has a method to determine if there has been an accident.

**Input data:**
- All coordinates are entered as two integer values separated by ';'. For example: 5;4.
- Input zone parameters: the program automatically determines the shape of the zone based on the data entered:
  - For a circle - two values entered and separated by a space: its center and radius. For example: 5;4 6
  - For triangular - three points separated by spaces. For example, 5;4 3;6 2;5
  - For quadrangular - four points separated by spaces. The points must be entered in the sequence of their connection. For example: 0;1 0;2 1;2 1;1.
- The rest of the information about the zones, for easy use, must be written in code
- Entering points with accident coordinates
- Incorrect input data causes an error
- Finding an accident on the borders of the zone means that it is located in the zone under consideration.

**Output data:**
- The program outputs full information about the zone and the accident.
- The program outputs whether an accident occurred in the entered zone. 
If not, the output must offer the user a common phone number for city services (88008473824)

**Example**
_Input data_
```
Enter zone parameters:
3;4 2

Enter the zone info:
Enter phone number: 
89347362826
Enter name: Sovetsky 
district
Enter emergency dept: 
49324
Enter danger level: 
low 

Enter an accident coordinates:
9;9

Enter the accident info:
Enter description: 
the woman said her cat can't get off the tree
Enter phone number: 
+74832648573
Enter type: 
cat on the tree
```
_Output data_
```
An accident is not in Sovetsky district
Switch the applicant to the common number: 88008473824
```

### Task 2. Number masking
The telephone mask is a useful UX feature that improves the readability of phone numbers.  
Write a String class extension that applies two different masks to a phone number:
- It works with 11-digit numbers starting with 7 or 8, or 12-digit numbers starting with +7:
  - If the operator code is 800, the number is converted to "8 (800) xxx xxx xx".
  - For other operator, the mask is "+7 xxx xxx-xx-xx-xx"
  - Notice that in addition to brackets, spaces, and hyphens, the first digit (country) also changes depending on the mask. Example: 84352835724 is converted to +7 435 283-57-24. 
- The other numbers are ignored 

**Check the result:** apply this extension in the previous task to display the zone and applicant phone information, then check the task again.


| Input data| Output data |
| ------ | ------ |
| 88005553535  |8 (800) 555 35 35| 
|89152342343|+7 915 234-23-43|

### Bonus task 3. Surprises are everywhere
Describe the object of the city. The city must have:
  - Name
  - Collection with different zones (can be written in code for simplicity)

Determine in which zone the accident occurred, using one city as an example. If the accident point falls between zones, the program switches it to the branch from the nearest zone. 
If there is an accident on the border of the zones, output one of them.

**Input data:**  the coordinates of the accident
**Output data:** First, the program types the city: the name and the common phone number of the city services (with a mask). Then, it types the full information about the accident and the monitored zones with their masked phone number

_Zone data_
For example, in the same format as in task 1, let's highlight the coordinates of zones of Novosibirsk: Sovetsky district - (7;7 1), Kalinisky district - (11;11 12;12 12;11), Kirovsky district - (0;0 0;-2 -2;0 -1;1).

The accident data can be any and determined in advance. For example, 
`description` - "the woman said her cat can't get off the tree", `phone number` - "+7 934 736-28-26", `type` - cat on the tree.

**Example**:
_Input data_
```
Enter an accident coordinates:
9;9
```
_Output data_
```
The city info:
  Name: Novosibirsk 
  The common number: 8 (800) 847 38 24

The accident info:
  Description: the woman said her cat can't get off the tree
  Phone number: +7 934 736-28-26
  Type: cat on the tree

The accident didn't match with any zone. The nearest zone: Sovetsky district
The zone info:
  The shape of area: circle 
  Phone number: +7 934 736-28-26
  Name: Sovetsky district
  Emergency dept: 49324
  Danger level: low 
```
