import Foundation

// делегат
protocol PlayerAction {
    func findOpponent(_ profile: Profile) -> Profile?
}

class Server: PlayerAction {
    // переменные
    var serverAddress: String
    var profiles: [Profile]
    
    // инициализатор
    init(serverAddress: String, profiles: [Profile] = []) {
        self.serverAddress = serverAddress
        self.profiles = profiles
    }
    
    // поиск противника
    func findOpponent(_ profile: Profile) -> Profile? {
        profile.status = .SEARCH
        
        startSearch(profile)
        
        let opponent = profiles.first(where: { $0.status == .SEARCH && $0.id != profile.id })
        
        resultSearch(left: profile, right: opponent)
        
        return opponent
    }
    
    // начало поиска
    private func startSearch(_ profile: Profile) {
        print("\nStart Search")
        profile.info()
        self.info()
    }
    
    // результат поиска
    private func resultSearch(left: Profile, right: Profile?) {
        print("\nResult Search")
        print("SearcherProfile:")
        print(left.description)
        print("Opponent:")
        print(right != nil ? right!.description : "nil")
        
        switch right {
        case nil:
            left.status = .IDLE
        default:
            left.status = .IN_PLAY
            right?.status = .IN_PLAY
        }
    }
    
    // установить массив профилей
    func setProfiles(profiles: [Profile]) {
        self.profiles = profiles
    }
    
    // описание списка профилей
    func descriptionProfiles() -> String {
        var description = ""
    
        if profiles.isEmpty == false {
            description += "["
            
            for item in profiles {
                description += item.description + ", "
            }
            
            description = String(description.dropLast(2)) + "]"
        }
        
        return description
    }
    
    // информация
    func info() {
        print("SearcherProfile:")
        print(self.descriptionProfiles())
    }
}
