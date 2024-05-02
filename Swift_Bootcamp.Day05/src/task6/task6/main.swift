import Foundation
import RxSwift

let firstCollection = Observable.of("first", "second", "third")

func filterStrings(_ collection: Observable<String>) async -> Int {
    var result: Int = 0
    
    _ = collection
        .subscribe(onNext: {
            result += $0.count
        }).disposed(by: DisposeBag())
    
    return result
}

func main() async {
    let filteredStrings = await filterStrings(firstCollection)
    print(filteredStrings)
}

await main()
