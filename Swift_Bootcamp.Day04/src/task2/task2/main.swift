// Переменные
var barista_1 = Barista(name: "swissmer", lastName: "Mers", experience: 15)
var barista_2 = BaristaMachine(name: "V2.0")
var arrCoffee = [Coffee(name: "Cappuccino", price: 2.0), Coffee(name: "Americano", price: 1.5), Coffee(name: "Latte", price: 2.3)]

// выбор баристы
print("Choose barista:")
print("1. Man")
print("2. Machine")

// выбор баристы
var chooseBarista = readLine()
while chooseBarista != "1" && chooseBarista != "2" {
    print("Try again!")
    chooseBarista = readLine()
}

// процент
var percent = chooseBarista == "1" ? 1 : 0.9
print("Choose coffee in menu:")
for (index, item) in arrCoffee.enumerated() {
    print("\(index + 1). \(item!.name!) \(item!.price * percent)$")
}

// выбор кофе
var chooseCoffee = readLine()

while chooseCoffee != nil && !((0..<arrCoffee.count).map { String($0 + 1) }.contains(chooseCoffee!)) {
    print("Try again!")
    chooseCoffee = readLine()
}

if chooseBarista == "1" {
    barista_1!.brew(arrCoffee[Int(chooseCoffee!)! - 1]!)
} else {
    barista_2.brew(with: arrCoffee[Int(chooseCoffee!)! - 1]!)
}
