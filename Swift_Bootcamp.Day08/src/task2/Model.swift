import Foundation

struct User {
    var id: Int
    var name: String
    var email: String
    var age: Int
}

protocol NetworkService {
    func getUsers() -> [User]
}

class NetworkServiceImpl: NetworkService {
    func getUsers() -> [User] {
        return [
            User(id: 1, name: "Катя", email: "kate@example.com", age: 30),
            User(id: 2, name: "Данил", email: "danil@example.com", age: 25),
            User(id: 3, name: "Кирилл", email: "kirill@example.com", age: 35)
        ]
    }
}

protocol DatabaseService {
    func saveUsers(_ users: [User])
}

class ReleaseDatabaseServiceImpl: DatabaseService {
    func saveUsers(_ users: [User]) {
        print("Release: \(users) were saves")
    }
}

class DebugDatabaseServiceImpl: DatabaseService {
    func saveUsers(_ users: [User]) {
        print("Debug: \(users) were saves")
    }
}

class UserRepository {
    let networkService: NetworkService
    let databaseService: DatabaseService
    var users: [User] = []
    
    init(networkService: NetworkService, databaseService: DatabaseService) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
    
    func updateUsers() {
        self.users = networkService.getUsers()
        databaseService.saveUsers(users)
    }
}
