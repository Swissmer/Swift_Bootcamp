import Foundation

// Массив уникальных чисел
let one = ["", "one-", "two-", "three-", "four-",
                   "five-", "six-", "seven-", "eight-",
                   "nine-", "ten-", "eleven-", "twelve-",
                   "thirteen-", "fourteen-", "fifteen-",
                   "sixteen-", "seventeen-", "eighteen-",
                   "nineteen-"]

// Массив десятков
let ten = ["", "", "twenty-", "thirty-", "forty-",
           "fifty-", "sixty-", "seventy-", "eighty-",
           "ninety-"]

// Доп функция
func oneOrTwoNumber(_ num: Int,_ s: String) -> String {
    var str: String = "";
    
    if (num > 19) {
        str += ten[num / 10] + one[num % 10]
    } else {
        str += one[num]
    }
    if (num != 0) {
        str += s
    }
    return str
}

// Функция для конвертации
func converToNumber(_ n: Int) {
    var num = n
    var result: String = ""
    // minus
    if (num < 0) {
        result += "minus-"
        num *= -1
    }
    
    // million
    if (num == 1000000) {
        result += "million"
    } else if (num < 1000000) {
        // ?.....
        result += oneOrTwoNumber((num / 100000) % 100, "hundred-")
        
        // .??...
        result += oneOrTwoNumber((num / 1000) % 100, "thousand-")
        
        // ...?..
        result += oneOrTwoNumber((num / 100) % 10, "hundred-")
     
        // ....??
        result += oneOrTwoNumber(num % 100, "")
        
        if (result == "") {
            result = "zero"
        } else {
            result.removeLast()
        }
    }
    
    print(result)
    
}

// Главная функция
func mainFunc() {
    print("The program is running. ", terminator: "")
    
    for i in 0... {
        if (i % 5 == 0) {
            print("Enter a number or type \"exit\" to stop:")
        } else {
            print("Enter a number:")
        }
        
        // чтение строки
        let temperature = readLine()
        
        if (temperature == "exit") {
            print("Bye!")
            break
        }
        
        // не целое число!
        if (Int(temperature!) == nil ) {
            print("Incorrect format, try again.")
            continue
        }
        
        // число за границей
        if (Int(temperature!)! > 1000000 || Int(temperature!)! < -1000000) {
            print("The number is out of bounds, try again.")
            continue
        }
        
        converToNumber(Int(temperature!)!)
    }
}

mainFunc()
