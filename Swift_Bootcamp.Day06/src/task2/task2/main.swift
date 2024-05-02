import Foundation
import RealmSwift
import RxSwift
import RxRealm

// Модель
let model = RecipesViewModel()

print("=Добавление элементов=")
model.createRecipe(Recipe(title: "Dessert with cookies", instructions: "Take the dishes in which you will serve dessert. Put 2 tablespoons of yogurt and half the norm of cottage cheese on the bottom.", imageURL: "dessert_with_cookies"))
model.createRecipe(Recipe(title: "Fruit sweets", instructions: "Roll in cocoa from all sides.", imageURL: "sweets"))

print("=Чтение данных=")
autoreleasepool {
    model.readRecipes()
        .subscribe(onNext: { recipes in
            print("\n", recipes, "\n")
        }).dispose()
}

print("=Удаление первого элемента=")
autoreleasepool {
    model.readRecipes()
        .take(1)
        .subscribe(onNext: { recipes in
            if let firstRecipe = recipes.first {
                model.deleteRecipe(firstRecipe)
            }
        })
        .dispose()
}
autoreleasepool {
    model.readRecipes()
        .subscribe(onNext: { recipes in
            print("\n", recipes, "\n")
        }).dispose()
}

print("=Обновление названия первого элемента=")
autoreleasepool {
    model.readRecipes()
        .take(1)
        .subscribe(onNext: { recipes in
            if let firstRecipe = recipes.first {
                model.updateRecipes(firstRecipe, Recipe(title: "new title", instructions: firstRecipe.instructions, imageURL: firstRecipe.imageURL))
            }
        })
        .dispose()
}
autoreleasepool {
    model.readRecipes()
        .subscribe(onNext: { recipes in
            print("\n", recipes, "\n")
        }).dispose()
}
    
print("=Поиск по названию=")
var recipe = model.findRecipe("new title")
print(recipe ?? "nil")

// Очищаем всю базу
model.deleteAllRecipes()

