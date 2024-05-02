### Hello!

The following topics are covered in this project:

- Generics are classes that can have type parameters. You can use them to write a class or method that will work with arbitrary data types rather than specific ones: the type (or type hierarchy) will be defined by the developer in the context of use. At the same time, the tool provides type safety: after specifying a type or a type hierarchy, work with this generic occurs only in the context of the specified type.
- Lazy initialization. There are situations where the creation of variables should not happen at the moment the class is used. It can also help to optimize code and calculations.
- Functional types. Working with them is certainly worthy of attention. The developers have provided excellent support for this popular tool, and also added some handy constructs for performing tasks in the context of an object.

## Topics:
- Generics
- Subscript
- Lazy initialization
- Delegates

**Tip!** Before you do your tasks, take a look at the examples in [documentation](https://docs.swift.org/swift-book/LanguageGuide/Generics.html), which provide several examples of possible generic use.

### Project: Game making utilities

## Tasks:

**Requirement!** Create a workspace inside the src folder named day03. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day03/quest1, day03quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Westworld

Describe a class that simulates a revolver. 
In this task it is a typed class. 
The revolver's moon clip contains an element according to the declared type. 
For example, RevolverMoonClip<Int> will store elements of `Int` type.

- The revolver's moon clip is an array of 6 elements. If the slot is empty, then `nil` must be stored there.
- You can add one element to the nearest free slot with the `add()` method. If it is added successfully, it returns true, otherwise it returns false.
- It is possible to add via a list of elements. The function takes another collection as a resource from which all elements are added to the moon clip. If there are not enough elements in the collection, the revolver structure is filled as much as possible. If the list is empty, the method returns false.
- The structure has a `pointer` property. You can use it to get the current element on the trigger. This is the element in the moon clip with the index 0.
- You can remove elements one by one with the `shoot()` method, which returns the deleted element. The deletion starts with the `pointer` element.
- You can call `unloadAll()` for all elements at once or `unload(index)` to extract one. The function returns the extracted element or a list of all elements.
- You can scroll the moon clip with the `scroll()` method, changing the pointer position to a random element. The sequence of elements between each other must be preserved, and the element on the trigger must change.
- Add a getSize() method that returns the number of elements in the revolver.
- Create an extension function `toStringDescription()` for a class that presents information about the class object and its elements as `String`. Information about the elements is written starting from the element's position on the trigger (pointer).
- The class comparison operator `==` works correctly. Override it with the `Equatable` protocol.Class objects are equivalent if they have the same combination of elements, starting from any position, including nil. An example of a comparison is given below. 
- Create a `subscript(index: Int`) method for the class. It will return an element for any revolver that is at the given position in the clip when accessed by index. If the index is greater than a number of elements in the moon clip, an error will occur.

**Check the result:** Write a program that shows how the `RevolverMoonClip` class works and run it
1. Create a revolver object, filling it with as many elements as possible using the constructor. Output to the console a description class of `RevolverMoonClip<Type>` type , the contents of the moon clip, starting with `pointer` and the `pointer` itself.
2. Retrieve the first and last element in the clip with `subscript`, by calling the indices of the corresponding elements.
3. Call the `scroll` method and display the object in the console. The result must start with a different element (but it can be equal in value). The order between the elements must be maintained.
4. Remove 4 elements one by one. Print the class object and compare it with the previous output. The modified moon clip must start with the 5th element, followed by the same element as before, then 4 `nil` values.
5. Create a collection of 8 elements of the same type as the generic of the created object. Add this collection to the revolver and output a comparison of the old and new collection in the revolver. The revolver must be filled completely with the first 4 elements of the collection. The `pointer` is set each time you add a filled moon clip element to the revolver.
6. Retrieve all elements of the `unloadAll` class. Print the size of the retrieved list and the size of the object ( must be 6 and 0) 
7. Add 4 `supply` elements to the class object collection. The size of the revolver's moon clip should become 4.
8. Create a new object with the same elements as in the list above. You also need to make a pre-scroll. Then use the `==` operator to compare whether these objects are equivalent. The result of the operation must be true.

_Output example_
```
1. Adding elements
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, 7, 2, 56, 4]
Pointer: 3

2. Subscript
3, 4

3. Scroll
Structure: RevolverMoonClip<Int> 
Objects: [7, 2, 56, 4, 3, 54]
Pointer: 7

4. Deletion
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

5. Supply collection
Before: 
Supply collection: [4, 6, 3, 22, 77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [22, 3, 6, 4, 3, 54]
Pointer: 22

6. Extraction
The extracted list: [22, 54, 6, 4, 3, 54]
size: 6

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil
size: 0

7. Supply collection 2
Before:
Supply collection: [77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [5, 76, 43, 77, nil, nil]
Pointer: 5

8. Equals
Structure: RevolverMoonClip<Int> 
Objects: [nil, 5, 76, 43, 77, nil]
Pointer: nil

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, 5, 76, 43, 77]
Pointer: nil

Result: equals
```

### Task 2. Bullets

**Bullet:**
- Create a class for a bullet
- Here you must also add a field to describe the bullet (blank or loaded)
- You can use the `UID` class to make your bullets unique
-The bullet must contain the caliber property (e.g., 22, 38, 45)
- The class must have its own `shoot()` method with "Bang" and caliber information output

**Revolver class contents update:**
- Add the caliber property for the revolver
- Make the revolver work only with the `Bullet` type. You can't put bullets of different calibers in the same moon clip. Remove typification from the class.
- When `shoot()` is called, a corresponding call should be made to the bullets as well. However, if a bullet is blank, the shoot class does not need to be called. 

**The view of the appropriate logic for revolver and bullet classes:**
  - A bullet can only be in one revolver’s moon clip. If you try to add a bullet that is already in another moon clip, the revolver `add` method must return false. Also, if you are adding a collection of bullets, a similar bullet must be ignored and the rest is added. Similarly for bullets that do not match the caliber of the revolver.
 
**Check the result:** to check, create a program that does the following. 
- Check that loaded bullets fire and blanks don't
- Try adding a bullet to different revolvers. The first addition will return true, the secondary will return false. Pre-create two blank revolvers.
- Try adding a bullet to two different collections. And try adding these collections to two different revolvers. Pre-create two blank revolvers.
 

_Output example_
```
1. Shoot or damp
Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id1, charged, 32), Patron(id2, damp, 32), nil, nil, nil, nil]
Pointer: Patron(id1, charged, 32)

Shoot # call shoot()
Bang 32

Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id2, damdp, 32), nil, nil, nil, nil, nil]
Pointer: Patron(id2, damp, 32)

Shoot 
Click
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

2. Unique Patron
Patron(id, charged, 32)

Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add1 # call add()
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add2
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

3. Unique Patron in collection
Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

[Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32)]
[Patron(id, charged, 32), Patron(id3, charged, 32), Patron(id4, charged, 32)]

Add1 # call add for 1 st collection

Add2 
Revolver1: [Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32), nil, nil, nil]
Revolver2: [Patron(id3, charged, 32), Patron(id4, charged, 32), nil, nil, nil, nil]
```

### Task 3. Player profile

In this task you need to create an object for the player profile and implement the `delegate` pattern by assigning a server object to the player class to search for an enemy.

**Player profile:**
Class `Profile` must contain:
- ID using `UUID`.
- Nickname
- Age
- Name
- Revolver
- Profile creation date in the form of `String`
- Status (`IN_PLAY` in game, `SEARCH` - in search, `IDLE` waiting; `OFFLINE`)
- The link that will be generated with the `lazy var` variable using the example `http://gameserver.com/${id}-${nickname}`

**Game server**
Class `Server` will describe the logic of the interaction between the players. The object must contain the following:
- Server address
- List of players on the server (`Profile`list)

**Server delegate in profile**
It's not unusual for an IOS application to use the pattern `Delegate` to call part of the logic. Let's implement this pattern using the example of a player's call to search for an opponent.
Create a `PlayerAction` protocol, which describes the possible actions of the player when interacting with the server. In our case, the function `findOpponent` will be described there. 
Class `Server` class must inherit the protocol and implement this function. The function returns the profile of the found player.
Add the server delegate as a `playerActionDelegate` variable of the `PlayerAction` class, which will call the enemy search request.

**Check the result:** create several profile objects with different statuses and put them on the server. Create your own profile that is idle. Also put him on the server. 
Then, the program must call the search for the opponent and change the status of the player to `SEARCH`. The function must return the opponen with the new status `IN_PLAY` and change the status in the player's profile.

_Output example_
```
SearcherProfile:
Profile("coolpicker", IDLE)

ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH), Profile("coolpicker", IDLE)]

Start Search
SearcherProfile:
Profile("coolpicker", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", SEARCH)]

Result Search
SearcherProfile:
Profile("coolpicker", SEARCH)
Opponent:
Profile("lrdxg", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lordyxD", IN_PLAY), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", IN_PLAY)]
```

### Bonus task 4. Types of weapons
The `Weapon` protocol must contain:

The revolver class `Revolver` must be inherited from ` Weapon`.  Define damage depending on the caliber of the bullet (caliber = amount of damage). 

Create two more types of weapons -  `Knife` and  `Riffle`. 

The `Riffle` class is similar in functionality to a revolver. However, the rifle must be reloaded each time you add a bullet, as the clip can only contain one bullet. The mechanism of adding bullets to the clip is similar to a revolver. The rifle bullets are also of the `Bullet` type.

****Check the result:**
- Create three types of weapons: revolver (the moon clip must be empty), rifle (the magazine must be empty) and knife.
- Check the logic of adding bullets to the `Revolver` and `Riffle`. In the case of a revolver, scroll the revolver's moon clip first.
- Output the damage of weapons with different bullets. The larger the size, the more damage the bullet should do.
- When stabbed, the `Crrr!` and the amount of damage should be printed. 

_Output example_
```
Knife("knife butterfy", 10)
Revolver("Revolver", 20)
Riffle("AWP", 88)

Knife shoot
Crrr! 10

Revolver Calibre 20

Add elements: [Patron(id, сharged, 10), Patron(id1, damp 20), Patron(id2, damp, 20), Patron(id3, damp, 20)]
Result adding: [Patron(id1, damp 20), Patron(id2, damp, 20), Patron(id3, damp, 20)]

Scrolling:  [Patron(id2, charged, 20), Patron(id3, damp, 20), Patron(id1, damp 20)]
Shoot: 
Bang 20


Riffle Calibre 50
Add element: Patron(id, damp, 50)
Shoot: 
Click
```

### Bonus task 5. The good, the bad, the ugly

You must describe the logic of the battle in the server object:
- The `fight()` method is added to the `PlayerAction` protocol. This method must return true if the player wins, false if the opponent wins or draw.
- The battle itself takes place with a random order of action. You must determine who attacks next randomly. At the start the players have 100 HP each. Each shot takes away HP according to the damage of the weapon. The moment one of the players has 0 ponts or less, the game ends. The winner is the player with positive health points.
- Each attack should print the current state of the battle in the form of a string of nicknames of fighters and their health, as well as the amount of damage inflicted. For example - "Player 1 shoot Player1 90 - 80 Player2".
- Twelve bullets must be created for the revolver before the game. The bullets are generated by the server. There is a 50% chance that a bullet can be a blank. Six bullets are added to the revolver before the game starts. The moment these bullets run out, the remaining 6 are added to the revolver.
- Four bullets must be created for the rifle before the game. The bullets are generated by the server. There is a 50% chance the bullet could be a blank. After each shot a new bullet is added to the rifle.
- If the player runs out of bullets, he can no longer attack.
- If both players run out of bullets and stay alive, the game ends in a draw.
- Make an informational message to accompany the action of adding bullets and scrolling a clip. For example - "Player1 scrolling"

**Check the result:** 
- Create 2 players with different types of weapons.
- Check that the appropriate amount of damage is done during combat and that the current health status of the players is displayed correctly.

_Output example_
```
MyProfile nickname - "coolpicker", weapon - knife, damage - 10
Opponent nickname - "lrdxg", weapon - revolver, calibre - 35, damage - 35

lrdxg scrolling

Fight!

coolpicker 100 - 100 lrdxg

coolpicker shoot
Crrr! 10
coolpicker 100 - 90 lrdxg

coolpicker shoot
Crrr! 10
coolpicker 100 - 80 lrdxg

lrdxg shoot
Click
coolpicker 100 - 80 lrdxg

lrdxg shoot
Click
coolpicker 100 - 80 lrdxg

lrdxg shoot
Bang 35
coolpicker 65 - 80 lrdxg

lrdxg shoot
Click
coolpicker 65 - 80 lrdxg

lrdxg shoot
Click
coolpicker 65 - 80 lrdxg

lrdxg shoot
Click
coolpicker 65 - 80 lrdxg

lrdxg drum is empty
lrdxg adding elements
lrdxg scrolling

lrdxg shoot
Bang 35
coolpicker 30 - 80 lrdxg


lrdxg shoot
Bang 35
coolpicker 0 - 80 lrdxg

You LOSE

lrdxg winner
```
