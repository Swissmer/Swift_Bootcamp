import RxSwift

// MARK: - Доменный слой (Связующий)
class RecipeRepository {
    private let networkService: NetworkService
    private let databaseService: DatabaseService
    var result: [RecipeForView] = []
    var isLoading = PublishSubject<Bool?>()
    
    init(networkService: NetworkService, databaseService: DatabaseService) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
    
    // Загрузка значений
    func uploadRecipes() {
        if !self.databaseService.checkRecipes() {
            print("Загрузка...")
            updateRecipes()
        }
        else {
            print("Значение в базе!")
            self.result = transformation(databaseService.getRecipes())
            DispatchQueue.main.async {
                self.isLoading.onNext(false)
            }
        }
    }
    
    // Обновление значений
    func updateRecipes() {
        self.isLoading.onNext(true)
        networkService.getRecipes { value in
            if !value.isEmpty {
                self.databaseService.saveRecipes(value) {
                    self.isLoading.onNext(false)
                    self.result = self.transformation(self.databaseService.getRecipes())
                }
            } else {
                print("Ошибка в подключении!")
                DispatchQueue.main.async {
                    self.isLoading.onNext(nil)
                }
            }
            
        }
    }
    
    // новое значение
    func updateValue(_ obj: RecipeForView) {
        let tmp = RecipesAll(name: obj.name, descript: obj.descript, imageData: obj.imageData, steps: obj.steps)
        tmp._id = obj._id
        databaseService.update(tmp)
    }
    
    // преобразование
    func transformation(_ obj: [RecipesAll]) -> [RecipeForView] {
        var transformedArray: [RecipeForView] = []
        for recipe in obj {
            let transformedRecipe = RecipeForView(_id: recipe._id, name: recipe.name, descript: recipe.descript, steps: recipe.steps.map { value in
                return Step(position: value.position, display_text: value.displayText)
            }, imageData: recipe.imageData)
            
            transformedArray.append(transformedRecipe)
        }
        return transformedArray
    }
    
    // Удаление базы
    func removeDatabase() {
        databaseService.removeData()
    }
}
