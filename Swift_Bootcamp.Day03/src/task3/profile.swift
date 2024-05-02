import Foundation

// перечесление статутов
enum ProfileStatus {
    case IN_PLAY
    case SEARCH
    case IDLE
    case OFFLINE
}

class Profile {
    // переменные
    let id: UUID
    let nickname: String
    var age: Int
    var name: String
    var revolver: RevolverMoonClip
    var createdAt: String = ""
    var status: ProfileStatus
    // lazy-by-need
    lazy var profileLink: String = {
        return "http://gameserver.com/\(id.uuidString)-\(nickname)"
    }()
    // вычисляемая переменная
    var description: String {
        return "Profile(\"\(nickname)\", \(status))"
    }
    // делегат сервера
    var playerActionDelegate: PlayerAction?
    
    // инициализатор
    init(nickname: String, age: Int, name: String, revolver: RevolverMoonClip = RevolverMoonClip(caliber: 32), status: ProfileStatus, playerActionDelegate: PlayerAction? = nil) {
        self.id = UUID()
        self.nickname = nickname
        self.age = age
        self.name = name
        self.revolver = revolver
        self.status = status
        self.createdAt = getCurrentDateString()
        self.playerActionDelegate = playerActionDelegate
    }
    
    // получение даты
    private func getCurrentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    // поиск оппонента
    func findOpponent() -> Profile? {
        return playerActionDelegate?.findOpponent(self)
    }
    
    // информация
    func info() {
        print("SearcherProfile:")
        print(self.description)
    }
}
