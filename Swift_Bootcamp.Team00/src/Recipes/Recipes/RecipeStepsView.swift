import SwiftUI

struct RecipeStepsView: View {
    @State private var selection = 0
    @Environment(\.presentationMode) var presentationMode
    var arr: [Step]
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(arr.indices, id: \.self) { index in
                VStack {
                    Text("\(index + 1). \(arr[index].step)")
                        .padding()
                    Button(action: {
                        withAnimation {
                            if index < arr.count - 1 {
                                selection += 1
                            } else {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }, label: {
                        Text(index < arr.count - 1 ? "Next" : "End")
                    })
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .navigationBarBackButtonHidden(true)
    }
}
