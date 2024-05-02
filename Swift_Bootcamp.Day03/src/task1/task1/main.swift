// #1
print("1. Adding elements")
var revolver = RevolverMoonClip<Int>()
revolver.add([4, 56, 2, 7, 54, 3])
print(revolver.toStringDescription())

// #2
print("\n2. Subscript")
print(revolver[0]!, revolver[5]!, separator: ", ")

// #3
print("\n3. Scroll")
revolver.scroll()
print(revolver.toStringDescription())

// #4
print("\n4. Deletion")
for _ in 0..<4 {
    revolver.shoot()
}
print(revolver.toStringDescription())

// #5
print("\n5. Supply collection")
let supplyCollection = [4, 6, 3, 22, 77, 43, 76, 5]
print("Before: \nSupply collection: \(supplyCollection)\n")
print(revolver.toStringDescription())

print("\nAfter add operation performed:")
revolver.add(supplyCollection)
print(revolver.toStringDescription())

// #6
print("\n6. Extraction")
let extractedList = revolver.unloadAll()
print("The extracted list: \(extractedList)\nsize: \(extractedList.count)")
print("\n\(revolver.toStringDescription())\nsize: \(revolver.getSize())")

// #7
print("\n7. Supply collection 2")
let supplyCollection2 = [77, 43, 76, 5]
print("Before:\nSupply collection: \(supplyCollection2)\n")
revolver.add(supplyCollection2)
print("After add operation performed:")
print(revolver.toStringDescription())

// #8
print("\n8. Equals")
let revolver2 = RevolverMoonClip<Int>()
revolver2.add([77, 43, 76, 5])
revolver.scroll()
revolver2.scroll()
print(revolver.toStringDescription())
print("\n\(revolver2.toStringDescription())")
print("Result: \(revolver == revolver2 ? "equals" : "not equals")")
