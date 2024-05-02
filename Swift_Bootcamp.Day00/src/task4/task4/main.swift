import Foundation

// Термометр
func thermometer() {
    // Значение системы счисления
    var scale = readLine()
    while !(scale == "Celsius" || scale == "Fahrenheit" || scale == "Kelvin") {
        print("Incorrect input. Enter a scale:")
        scale = readLine()
    }

    // Значение сезона
    var season = readLine()
    while !(season == "S" || season == "W") {
        print("Incorrect input. Enter a season:")
        season = readLine()
    }
    
    // Значение температуры
    var temperature = readLine()
    while (Int(temperature!) == nil) {
        print("Incorrect input. Enter a temperature:")
        temperature = readLine()
    }
    
    // Значение Влажности
    var humidity = readLine()
    while (Int(humidity!) == nil) {
        print("Incorrect input. Enter a temperature:")
        humidity = readLine()
    }
    
    printInfo(scale!, season!, temperature!, humidity!)
}

// Вывод информации
func printInfo(_ scale: String, _ season: String, _ temperature: String, _ humidity: String) {
    // Начальные переменные (Цельсия)
    var tempReal = Double(temperature)
    var option = 0
    var tempGlobal: [Double] = [22, 25]
    var humidityGlobal: [Int] = [30, 60]
    if (season == "W") {
        tempGlobal = [20, 22]
        humidityGlobal = [30, 45]
    }
    let arrOption = ["˚C", "F", "K"]
    // Перевод в нужную систему счисления
    if (scale == "Fahrenheit") {
        option = 1
        tempReal = tempReal! * 1.8 + 32.0
        tempGlobal[0] = tempGlobal[0] * 1.8 + 32.0
        tempGlobal[1] = tempGlobal[1] * 1.8 + 32.0
    } else if (scale == "Kelvin") {
        option = 2
        tempReal! += 273.15
        tempGlobal[0] += 273.15
        tempGlobal[1] += 273.15
    }
    
    var result3 = "The temperature is comfortable."
    var result4 = "The humidity is comfortable"
    
    print("The temperature is \(tempReal!) \(arrOption[option])")
    print("The comfortable temperature is from \(tempGlobal[0]) to \(tempGlobal[1]) \(arrOption[option]).")
        if (tempReal! < tempGlobal[0]) {
            result3 = "Please, make it warmer by \(abs(tempGlobal[0]-tempReal!)) degrees."
        }
        if (tempReal! > tempGlobal[1]) {
            result3 = "Please, make it colder by \(abs(tempGlobal[1]-tempReal!)) degrees."
        }
    print(result3)
    
    print("The comfortable humidity is from \(humidityGlobal[0]) % to \(humidityGlobal[1]) %")
    
    if (Int(humidity)! < humidityGlobal[0]) {
        result4 = "Please raise humidity by \(abs(humidityGlobal[0]-Int(humidity)!)) %."
    }
    if (Int(humidity)! > humidityGlobal[1]) {
        result4 = "Please reduce humidity by \(abs(humidityGlobal[1]-Int(humidity)!)) %."
    }
    print(result4)
}

// Главная функция
thermometer()


