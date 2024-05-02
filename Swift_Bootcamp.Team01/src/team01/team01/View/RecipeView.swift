import SwiftUI

struct RecipeView: View {
    @Binding var recipe: RecipeForView
    
    var body: some View {
        ScrollView {
            // image
            recipe.image
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 150, height: 150)
                .padding()
            // Description
            HStack {
                Text("Description")
                    .underline()
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            HStack {
                Text(recipe.descript)
            }.padding(.horizontal)
                .padding(.vertical, 1)
            
            // Steps
            HStack {
                Text("Steps")
                    .underline()
                    .fontWeight(.bold)
                Spacer()
            }.padding(.horizontal)
                .padding(.vertical, 10)
            ForEach(recipe.steps, id: \.self) { value in
                HStack {
                    Text("\(value.position). \(value.display_text)")
                    Spacer()
                }.padding(.horizontal)
                    .padding(.vertical, 10)
            }
            Spacer()
        }
        .navigationTitle(self.recipe.name).navigationBarTitleDisplayMode(.inline)
        // Edit
        .navigationBarItems(trailing:
                                NavigationLink(destination: EditView(recipe: $recipe)) {
            Image(systemName: "pencil.tip.crop.circle").foregroundStyle(Color.black)
        }
        )
    }
}
