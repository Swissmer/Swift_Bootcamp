import Foundation

// Модель
var model = RecipesViewModel()

print("=Добавление элементов=")
model.createRecipe(Recipe(title: "Dessert with cookies", instructions: "Take the dishes in which you will serve dessert. Put 2 tablespoons of yogurt and half the norm of cottage cheese on the bottom.", imageURL: "dessert_with_cookies"))
model.createRecipe(Recipe(title: "Fruit sweets", instructions: "Roll in cocoa from all sides.", imageURL: "sweets"))

print("=Чтение данных=")
var info = model.readRecipes()
print("\n", info, "\n")

print("=Удаление первого элемента=")
model.deleteRecipe(info[0])
info = model.readRecipes()
print("\n", info, "\n")

print("=Обновление названия первого элемента=")
model.updateRecipes(info[0], Recipe(title: "new title", instructions: info[0].instructions, imageURL: info[0].imageURL))
info = model.readRecipes()
print("\n", info, "\n")

print("=Поиск по названию=")
var recipe = model.findRecipe("new title")
print(recipe ?? "nil")

// Очищаем всю базу
model.deleteAllRecipes()
