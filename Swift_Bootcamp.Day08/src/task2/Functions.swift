import Foundation
import Swinject

func firstTask() {
    let container = Container()
    
    container.register(NetworkService.self) { _ in NetworkServiceImpl()}
    container.register(DatabaseService.self) { _ in ReleaseDatabaseServiceImpl()}
    container.register(UserRepository.self) { r in
        let networkService = r.resolve(NetworkService.self)
        let databaseSevice = r.resolve(DatabaseService.self)
        return UserRepository(networkService: networkService!, databaseService: databaseSevice!)
    }
    
    let userRepository1: UserRepository = container.resolve(UserRepository.self)!
    userRepository1.updateUsers()
    
    let userRepository2: UserRepository = container.resolve(UserRepository.self)!
    
    print("\nРезультат сравнения:", userRepository1 === userRepository2)
}

func secondTask() {
    let container = Container()
    
    container.register(NetworkService.self) { _ in NetworkServiceImpl()}
    container.register(DatabaseService.self, name: "release") { _ in ReleaseDatabaseServiceImpl()}
    container.register(DatabaseService.self, name: "debug") { _ in DebugDatabaseServiceImpl()}
    
    container.register(UserRepository.self, name: "release") { r in
        let networkService = r.resolve(NetworkService.self)
        let databaseSevice = r.resolve(DatabaseService.self, name: "release")
        return UserRepository(networkService: networkService!, databaseService: databaseSevice!)
    }
    
    container.register(UserRepository.self, name: "debug") { r in
        let networkService = r.resolve(NetworkService.self)
        let databaseSevice = r.resolve(DatabaseService.self, name: "debug")
        return UserRepository(networkService: networkService!, databaseService: databaseSevice!)
    }
    
    let userRepository1: UserRepository = container.resolve(UserRepository.self, name: "release")!
    userRepository1.updateUsers()
    
    print()
    
    let userRepository2: UserRepository = container.resolve(UserRepository.self, name: "debug")!
    userRepository2.updateUsers()
}

func thirdTask() {
    let container = Container()
    
    container.register(NetworkService.self) { _ in NetworkServiceImpl()}
    container.register(DatabaseService.self) { _ in ReleaseDatabaseServiceImpl()}
    
    container.register(UserRepository.self) { r in
        let networkService = r.resolve(NetworkService.self)
        let databaseSevice = r.resolve(DatabaseService.self)
        return UserRepository(networkService: networkService!, databaseService: databaseSevice!)
    }.inObjectScope(.container)

    
    let userRepository1: UserRepository = container.resolve(UserRepository.self)!
    userRepository1.updateUsers()
    
    let userRepository2: UserRepository = container.resolve(UserRepository.self)!
    
    print("\nРезультат сравнения:", userRepository1 === userRepository2)
}
