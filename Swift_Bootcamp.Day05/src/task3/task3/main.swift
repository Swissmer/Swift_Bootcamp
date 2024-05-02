import Foundation
import RxSwift

let firstCollection = Observable.of("first", "second", "third")

func filterStrings(_ collection: Observable<String>) async -> Bool {
    var result = true
    
    _ = collection
        .filter { $0.count <= 5 }
        .take(1)
        .subscribe(onNext: { _ in
            result = false
        }).disposed(by: DisposeBag())
    
    return result
}

func main() async {
    let filteredStrings = await filterStrings(firstCollection)
    print(filteredStrings)
}

await main()
