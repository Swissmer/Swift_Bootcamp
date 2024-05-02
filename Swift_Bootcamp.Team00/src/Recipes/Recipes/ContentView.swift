import SwiftUI

struct ContentView: View {
    @State private var listRecipes: [Recipes]?
    
    var body: some View {
        NavigationStack{
            List (listRecipes ?? [], id: \.self) { tmp in
                HStack {
                    tmp.image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    NavigationLink(tmp.name, value: tmp)
                }
            }
            .navigationDestination(for: Recipes.self) {
                value in RecipeView(recipe: value).navigationTitle(value.name).navigationBarTitleDisplayMode(.inline)
            }
            .navigationTitle(Text("Desert list"))
            .onAppear{
                self.listRecipes = load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
