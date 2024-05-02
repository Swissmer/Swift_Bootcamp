import Foundation

// #1
print("1. Shoot or damp")
var revolver = RevolverMoonClip(caliber: 32)
var patron1 = Patron(id: UUID(), status: .damp, caliber: 32)
var patron2 = Patron(id: UUID(), status: .charged, caliber: 32)
revolver.add([patron1, patron2])
print(revolver.toStringDescription())

print("\nShoot # call shoot()")
revolver.shoot()

print("\n", revolver.toStringDescription(), separator: "")
print("\nShoot")
revolver.shoot()
print(revolver.toStringDescription())

// #2
print("\n2. Unique Patron")
var patron = Patron(id: UUID(), status: .charged, caliber: 32)
print(patron.toStringDescription())

var revolver1 = RevolverMoonClip(caliber: 32)
print("\nRevolver1: ", revolver1.printObj(), separator: "")
var revolver2 = RevolverMoonClip(caliber: 32)
print("Revolver2:", revolver2.printObj())

print("\nAdd1 # call add()")
revolver1.add(patron)
print("Revolver1:", revolver1.printObj())
print("Revolver2:", revolver2.printObj())

print("\nAdd2")
revolver2.add(patron)
print("Revolver1:", revolver1.printObj())
print("Revolver2:", revolver2.printObj())

// #3
print("\n3. Unique Patron in collection")
let revolver_1 = RevolverMoonClip(caliber: 32)
let revolver_2 = RevolverMoonClip(caliber: 32)
print("Revolver1:", revolver_1.printObj())
print("Revolver2:", revolver_2.printObj())

let patron_1 = Patron(id: UUID(), status: .charged, caliber: 32)
let patron_2 = Patron(id: UUID(), status: .charged, caliber: 32)
let patron_3 = Patron(id: UUID(), status: .charged, caliber: 32)
let patron_4 = Patron(id: UUID(), status: .charged, caliber: 32)
let patron_5 = Patron(id: UUID(), status: .charged, caliber: 32)

let collection_1 = [patron_1, patron_2, patron_3]
let collection_2 = [patron_1, patron_4, patron_5]

print("\n", [patron_1.toStringDescription(), patron_2.toStringDescription(), patron_3.toStringDescription()], separator: "")
print([patron_1.toStringDescription(), patron_4.toStringDescription(), patron_5.toStringDescription()])

print("\nAdd1 # call add for 1 st collection")
revolver_1.add(collection_1)

print("\nAdd2")
revolver_2.add(collection_2)

print("\nRevolver1:", revolver_1.printObj())
print("Revolver2:", revolver_2.printObj())

