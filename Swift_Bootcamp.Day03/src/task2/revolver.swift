import Foundation

class RevolverMoonClip: Equatable {
    // переменные (Private)
    private var objects: [Patron?]
    private var pointer: Int
    private let caliber: Int
    
    // инициализатор
    init (caliber: Int) {
        self.objects = Array(repeating: nil, count: 6)
        self.pointer = 0
        self.caliber = caliber
    }
    
    // добавления элемента
    func add(_ element: Patron) -> Bool {
        var result = false
        
        if let index = objects.lastIndex(where: {$0 == nil}) {
            if self.caliber == element.caliber && element.gun == nil {
                result = true
                objects[index] = element
                element.gun = self
                pointer = index
            }
        }
        
        return result
    }
    
    // добавление списка элементов
    func add(_ collection: [Patron]) -> Bool {
        var result = false
        
        if !collection.isEmpty {
            for element in collection {
                if element.gun != nil {
                    continue
                }
                if !self.add(element) {
                    break
                }
                result = true
            }
        }
        
        return result
    }
    
    // метод стрельбы
    func shoot() -> Patron? {
        let result: Patron? = objects[pointer]
        
        if result != nil && result!.status != Patron.Status.damp {
            result!.shoot()
        } else {
            print("Click")
        }

        objects[pointer] = nil
        pointer = (pointer + 1) % objects.count
        
        return result
    }
    
    // извлечение списка элементов
    func unloadAll() -> [Patron] {
        let result = (objects.suffix(from: pointer) + objects.prefix(pointer)).compactMap{$0}
        
        objects = Array(repeating: nil, count: 6)
        pointer = 0
        
        return result
    }
    
    // извлечение элемента
    func unload(index: Int) -> Patron? {
        var result: Patron? = nil
        
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
    static func == (left: RevolverMoonClip, right: RevolverMoonClip) -> Bool {
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
    subscript (index: Int) -> Patron? {
        get {
            guard index >= 0, index < objects.count else {
                fatalError("Index out of range")
            }
            
            return objects[index]
        }
    }
    
    //Возвращает массив в виде строки
    func printObj() -> String {
        var description = "["
        
        for (_, element) in (objects.suffix(from: pointer) + objects.prefix(pointer)).enumerated() {
            description += "\(element != nil ? "\(element!.toStringDescription())" : "nil"), "
        }
        
        description = String(description.dropLast(2)) + "]"
        
        return description
    }
}

// инофрмация о классе (вопрос выводе элементов начиная с курка)
extension RevolverMoonClip {
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip \(self.caliber) caliber \nObjects: ["
        var pointerInfo = "Pointer: "
        
        for (index, element) in (objects.suffix(from: pointer) + objects.prefix(pointer)).enumerated() {
            if index == 0 {
                pointerInfo += "\(element != nil ? "\(element!.toStringDescription())" : "nil")"
            }
            description += "\(element != nil ? "\(element!.toStringDescription())" : "nil"), "
        }
        
        description = String(description.dropLast(2)) + "]\n"
        description += pointerInfo
        
        return description
    }
}
