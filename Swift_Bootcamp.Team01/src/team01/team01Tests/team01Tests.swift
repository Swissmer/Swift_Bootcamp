import XCTest
@testable import team01

final class team01Tests: XCTestCase {

    func testRemoteService() {
        let model = NetworkServiceImpl()
        model.getRecipes(completion: {value in
            XCTAssertTrue(!value.isEmpty)
        })
    }
    
    func testTransformation() {
        let model = ViewController()
        let value = RecipesAll(name: "Имя", descript: "Описание", imageData: Data(), steps: [])
        let result = RecipeForView(_id: value._id, name: "Имя", descript: "Описание", steps: [], imageData: Data())
        
        var genRes = true
        let getValue = model.recipes.transformation([value]).first
        
        if getValue?.name != getValue?.name || getValue?.descript != getValue?.descript || getValue?.steps != getValue?.steps || getValue?.imageData != getValue?.imageData || getValue?._id != getValue?._id {
            genRes = false
        }
        
        XCTAssertTrue(genRes)
    }
}
