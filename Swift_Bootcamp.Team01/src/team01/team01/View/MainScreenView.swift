import SwiftUI
import RealmSwift

struct MainScreenView: View {
    @State var listRecipes: [RecipeForView]
    @Binding var model: ViewController
    
    init(model: Binding<ViewController>) {
        self._model = model
        _listRecipes = State(initialValue: model.recipes.result.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            List(self.listRecipes.indices, id: \.self) { index in
                let recipeBinding = self.$listRecipes[index]
                let tmp = self.listRecipes[index]
                HStack {
                    tmp.image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    NavigationLink(destination: RecipeView(recipe: recipeBinding)) {
                        Text("\(self.listRecipes[index].name)")
                    }
                }
            }
            .navigationTitle(Text("Food list"))
            .navigationBarItems(trailing: Button(action: {
                model.recipes.removeDatabase()
                model.recipes.updateRecipes()
                listRecipes = model.recipes.result
            }) {
                Image(systemName: "arrow.circlepath").foregroundStyle(Color.black)
            })
        }
    }
}
