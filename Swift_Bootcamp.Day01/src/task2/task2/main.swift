import Foundation

// расширение для типа String
extension String {
    // маска
    func applyPhoneMask() -> String {
        var workLine = self
        var result = self
        
        if workLine.count == 12 && workLine.hasPrefix("+") && workLine[1] == "7" {
            workLine.removeFirst()
        }
        
        if workLine.count == 11 && (workLine.hasPrefix("7") || workLine.hasPrefix("8")) && Int(workLine) != nil {
            if workLine[1...3] == "800" {
                result = "8 (\(workLine[1...3]!)) \(workLine[4...6]!) \(workLine[7...8]!) \(workLine[9...10]!)"
            } else {
                result = "+7 \(workLine[1...3]!) \(workLine[4...6]!)-\(workLine[7...8]!)-\(workLine[9...10]!)"
            }
        }
        
        return result
    }
    
    // для str[...]
    subscript (range: CountableClosedRange<Int>) -> String? {
        var result: String? = nil
        if range.lowerBound <= range.upperBound && range.upperBound < count && range.lowerBound >= 0 && range.upperBound >= 0 {
            let startIndex = index(self.startIndex, offsetBy: max(0, range.lowerBound))
            let endIndex = index(startIndex, offsetBy: range.upperBound - range.lowerBound)
            result = String(self[startIndex...endIndex])
        }
        return result
    }
    
    // для  str[.]
    subscript (index: Int) -> String? {
        var result: String? = nil
        if index >= 0 && index < count {
            let charIndex = self.index(startIndex, offsetBy: index)
            result = String(self[charIndex])
        }
        return result
    }
}

// Пример использования:
let phone = readLine()!
let mask = phone.applyPhoneMask()
print(mask)
