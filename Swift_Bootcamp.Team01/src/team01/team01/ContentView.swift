import SwiftUI
import RxSwift
import RealmSwift
import Realm

struct ContentView: View {
    @State private var model = ViewController()
    @State private var isLoad: Bool? = true
    @State private var listRecipes: [RecipeForView] = []
    private var bag = DisposeBag()
    
    var body: some View {
        VStack {
            if isLoad == true {
                LoadingView()
            } else if isLoad == false {
                MainScreenView(model: $model)
            } else {
                ErrorView()
            }
        }
        .onAppear() {
            model.recipes.uploadRecipes()
            model.recipes.isLoading
                .subscribe(onNext: { isLoading in
                    self.isLoad = isLoading
                }).disposed(by: bag)
            listRecipes = model.recipes.result
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
