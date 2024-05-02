import Foundation

// Исключения
enum PossibleErrors: Error {
    case exception(String)
}

func makeNumbers() throws {
    // Опция
    let option = readLine()
    
    // Обработка исключений
    guard option == "lower" || option == "higher" else {throw PossibleErrors.exception("Неверно значение опции!")}
    guard var number = Int(readLine()!) else {throw PossibleErrors.exception("Ошибка в записи числа!")}
    
    // Обработка минуса
    var minus: Bool = false
    if (number < 0) {
        minus = true
        number *= -1
    }
    
    // Результат
    var result = ""
    if (minus) {result += "-"}
    
    // Рабочая строка
    var workingLine = String(number)
    if (option == "higher") {
        workingLine = String(workingLine.reversed())
    }
    
    // Главный цикл
    for item in workingLine {
        result += String(item)
        print(Int(result)!)
    }
}


// Проверка исключений 
do {
    try makeNumbers()
} catch PossibleErrors.exception(let message)  {
    print(message)
} catch {
    print("Unknow error")
}

