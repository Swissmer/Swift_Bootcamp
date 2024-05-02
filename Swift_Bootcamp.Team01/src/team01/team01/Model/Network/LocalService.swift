import Foundation
import SwiftUI
import Alamofire
import RealmSwift

// MARK: - Сетевой уровень (Локальный)
protocol DatabaseService {
    func saveRecipes(_ recipes: [Recipes], _ completion: @escaping () -> Void)
    func getRecipes() -> [RecipesAll]
    func checkRecipes() -> Bool
    func update(_ obj1: RecipesAll)
    func removeData()
}

class DatabaseServiceImpl: DatabaseService {
    // Сохранение в базу
    func saveRecipes(_ recipes: [Recipes], _ completion: @escaping () -> Void) {
        let basa = try! Realm()
        let dispatchGroup = DispatchGroup()
        for item in recipes {
            dispatchGroup.enter()
            AF.request(item.thumbnail_url).response { res in
                switch res.result {
                case .success(let data):
                    try! basa.write {
                        basa.add(RecipesAll(name: item.name, descript: item.description, imageData: data!, steps: item.instructions))
                    }
                case .failure(let error):
                    print(error)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
            print("Сохранили успешно!")
        }
    }
    
    // Получение значений из базы
    func getRecipes() -> [RecipesAll] {
        let basa = try! Realm()
        let result = basa.objects(RecipesAll.self)
        return Array(result)
    }
    
    // Удаление файлов Realm
    func removeData() {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let realmFileURL = fileURLs.first?.appendingPathComponent("default.realm") else {
            return
        }
        do {
            try FileManager.default.removeItem(at: realmFileURL)
        } catch {
            print("Error removing realm database file: \(error)")
        }
    }
    
    // Проверка на сущ. значений в базе
    func checkRecipes() -> Bool {
        let basa = try! Realm()
        var result = false
        if !(basa.objects(RecipesAll.self)).isEmpty {
            result = true
        }
        return result
    }
    
    // Обновление значения
    func update(_ obj: RecipesAll) {
        let basa = try! Realm()
        if let recipe = basa.object(ofType: RecipesAll.self, forPrimaryKey: obj._id) {
            try! basa.write {
                recipe.name = obj.name
                recipe.descript = obj.descript
                recipe.imageData = obj.imageData
                recipe.steps = obj.steps
            }
        }
    }
}
