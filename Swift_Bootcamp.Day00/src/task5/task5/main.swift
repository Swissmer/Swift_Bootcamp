import Foundation

// Проверка на пересечение
func checkCircles(_ arr: [Double]) {
    let x1 = arr[0], y1 = arr[1], r1 = arr[2], x2 = arr[3], y2 = arr[4], r2 = arr[5]
    let distance = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))
    if distance < abs(r1 - r2) || (distance == 0){
        print("One circle is inside another")
    } else if distance <= r1 + r2 {
        print("The circles intersect")
        // Вычисление
        let a = (pow(r1, 2) - pow(r2, 2) + pow(distance, 2)) / (2 * distance)
        let h = sqrt(pow(r1, 2) - pow(a, 2))
        let x3 = x1 + a/distance * (x2 - x1)
        let y3 = y1 + a/distance * (y2 - y1)
        var arrResult: [[Double]] = []
        
        // Добавление точек
        if (distance < r1 + r2) {
            arrResult.append([x3 + h/distance * (y2 - y1), y3 - h/distance * (x2 - x1)])
            arrResult.append([x3 - h/distance * (y2 - y1), y3 + h/distance * (x2 - x1)])
        } else {
            arrResult.append([x3 + h/distance * (y2 - y1), y3 - h/distance * (x2 - x1)])
        }
        print(arrResult)
    } else {
        print("The circles is not intersect")
    }
}

// Чтение данных
func readArr() -> [Double] {
    var result: [Double] = []
    for i in 0...5 {
        var line = readLine()
        while (Double(line!) == nil || ((i == 2 || i == 5) && Double(line!)! < 0)) {
            print("Couldn't parse a number. Please try again", separator: "")
            line = readLine()
        }
        result.append(Double(line!)!)
    }
    return result
}

var arr: [Double] = readArr()

checkCircles(arr)
