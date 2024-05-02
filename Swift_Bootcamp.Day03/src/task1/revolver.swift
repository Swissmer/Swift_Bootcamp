import Foundation

class RevolverMoonClip<T: Equatable>: Equatable {
    // переменные (Private)
    var objects: [T?]
    var pointer: Int
    
    // инициализатор
    init() {
        objects = Array(repeating: nil, count: 6)
        pointer = 0
    }
    
    // добавления элемента
    func add(_ element: T) -> Bool {
        var result = false
        
        if let index = objects.lastIndex(where: {$0 == nil}) {
            result = true
            objects[index] = element
            pointer = index
        }
        
        return result
    }
    
    // добавление списка элементов
    func add(_ collection: [T]) -> Bool {
        var result = false
        
        if !collection.isEmpty {
            for element in collection {
                if !self.add(element) {
                    break
                }
                result = true
            }
        }
        
        return result
    }
    
    // метод стрельбы
    func shoot() -> T? {
        let result: T? = objects[pointer]
        
        objects[pointer] = nil
        pointer = (pointer + 1) % objects.count
        
        return result
    }
    
    // извлечение списка элементов
    func unloadAll() -> [T] {
        let result = (objects.suffix(from: pointer) + objects.prefix(pointer)).compactMap{$0}
        
        objects = Array(repeating: nil, count: 6)
        pointer = 0
        
        return result
    }
    
    // извлечение элемента
    func unload(index: Int) -> T? {
        var result: T? = nil
        
        if index >= 0 && index < objects.count {
            result = objects[index]
            objects[index] = nil
        }
        
        return result
    }
    
    // прокрутить обойму
    func scroll() {
        pointer = Int.random(in: 0..<5)
    }
    
    // количество элементов
    func getSize() -> Int {
        return objects.compactMap{ $0 }.count
    }
    
    // оператор сравнения
    static func == (left: RevolverMoonClip<T>, right: RevolverMoonClip<T>) -> Bool {
        var result = false
        
        for i in 0..<6 {
            if (right.objects.elementsEqual(left.objects.suffix(from: i) + left.objects.prefix(i))) {
                result = true
                break
            }
        }
        
        return result
    }
    
    // индексы
    subscript (index: Int) -> T? {
        get {
            guard index >= 0, index < objects.count else {
                fatalError("Index out of range")
            }
            
            return objects[index]
        }
    }
}

// инофрмация о классе (вопрос выводе элементов начиная с курка)
extension RevolverMoonClip {
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip<\(T.self)> \nObjects: ["
        var pointerInfo = "Pointer: "
        
        for (index, element) in (objects.suffix(from: pointer) + objects.prefix(pointer)).enumerated() {
            if index == 0 {
                pointerInfo += "\(element != nil ? "\(element!)" : "nil")"
            }
            description += "\(element != nil ? "\(element!)" : "nil"), "
            
        }
        
        description = String(description.dropLast(2)) + "]\n"
        description += pointerInfo
        
        return description
    }
}
