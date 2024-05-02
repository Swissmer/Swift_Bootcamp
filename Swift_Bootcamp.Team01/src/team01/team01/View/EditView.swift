import SwiftUI
import RealmSwift
import PhotosUI

struct EditView: View {
    @Binding var recipe: RecipeForView
    @State private var recipeTmp: RecipeForView
    @State private var selectedItem: PhotosPickerItem?
    @Environment(\.presentationMode) private var presentationMode
    
    init(recipe: Binding<RecipeForView>) {
        self._recipe = recipe
        _recipeTmp = State(initialValue: recipe.wrappedValue)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // Title:
                HStack {
                    Text("Title:")
                        .underline()
                        .fontWeight(.bold)
                    Spacer()
                }
                TextEditor(text: $recipeTmp.name)
                    .frame(height: 100)
                    .padding()
                    .border(Color.primary, width: 2)
                    .cornerRadius(7)
                
                // Description:
                HStack {
                    Text("Description:")
                        .underline()
                        .fontWeight(.bold)
                    Spacer()
                }
                TextEditor(text: $recipeTmp.descript)
                    .frame(height: 100)
                    .padding()
                    .border(Color.primary, width: 2)
                    .cornerRadius(7)
                
                // Image:
                HStack {
                    Text("Image:")
                        .underline()
                        .fontWeight(.bold)
                    Spacer()
                    recipeTmp.image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Spacer()
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Text("Выбрать")
                            .padding(5)
                            .foregroundStyle(.white)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }.padding(.vertical, 10)
                
                // Steps:
                HStack {
                    Text("Steps:")
                        .underline()
                        .fontWeight(.bold)
                    Spacer()
                }
                ForEach(recipeTmp.steps.indices, id: \.self) { index in
                    let step = recipeTmp.steps[index]
                    HStack {
                        Text("\(step.position).")
                        TextEditor(text: Binding<String>(
                            get: { step.display_text },
                            set: { newText in
                                recipeTmp.steps[index].display_text = newText }
                        ))
                        .frame(height: 100)
                        .padding()
                        .border(Color.primary, width: 2)
                        .cornerRadius(7)
                    }
                }
                Spacer()
            }
            .padding()
            // Save
            .navigationBarItems(trailing: Button(action: {
                self.recipe = self.recipeTmp
                ViewController().recipes.updateValue(self.recipeTmp)
                print("Сохранил")
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "checkmark").foregroundStyle(Color.black)
            }))
            // Change photo
            .onChange(of: selectedItem) { _, _ in
                Task {
                    if let result = try! await selectedItem!.loadTransferable(type: Data.self) {
                        self.recipeTmp.imageData = result
                    }
                }
            }
        }
    }
}
