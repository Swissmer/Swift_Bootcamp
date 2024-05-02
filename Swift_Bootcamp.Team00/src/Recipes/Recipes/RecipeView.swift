import SwiftUI

struct RecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    var recipe: Recipes

    var body: some View {
        ScrollView {
            recipe.image
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 150, height: 150)
                .padding()
            HStack {
                Text("Ingredients")
                    .underline()
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            ForEach(recipe.ingredients.indices, id: \.self) {index in
                let value = recipe.ingredients[index]
                HStack {
                    Text("\(index + 1). \(value.name) - \(value.description)")
                    Spacer()
                }.padding(.horizontal)
                    .padding(.vertical, 1)
                
            }
            HStack {
                Text("Steps")
                    .underline()
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: RecipeStepsView(arr: recipe.steps)) {
                    Text("detail")
                }
                .padding(5)
                .foregroundStyle(.white)
                .background(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            }.padding(.horizontal)
                .padding(.vertical, 10)
            ForEach(recipe.steps.indices, id: \.self) {index in
                let value = recipe.steps[index]
                HStack {
                    Text("\(index + 1). \(value.step)")
                    Spacer()
                }.padding(.horizontal)
                    .padding(.vertical, 10)
                
            }
            Spacer()
        }
    }
}
