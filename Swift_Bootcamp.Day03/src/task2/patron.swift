import Foundation

class Patron: Equatable {
    // переменные
    let id: UUID
    var status: Status
    let caliber: Int
    weak var gun: RevolverMoonClip?  // Слабая ссылка на револьвер
    
    // патрон (холостой или заряженный)
    enum Status {
        case charged
        case damp
    }
    
    // инициализатор
    init(id: UUID, status: Status, caliber: Int) {
        self.id = id
        self.status = status
        self.caliber = caliber
    }
    
    // выстрел
    func shoot() {
        print("Bang! \(caliber)")
    }
    
    static func == (left: Patron, right: Patron) -> Bool {
        return left.id == right.id
    }
    
}

extension Patron {
    func toStringDescription() -> String {
        let description = "Patron(id: \(id.uuidString), status: \(status), caliber: \(caliber))"
        return description
    }
}
