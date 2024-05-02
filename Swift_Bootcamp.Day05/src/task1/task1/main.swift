import Foundation
import RxSwift

let firstCollection = Observable.of("first", "second", "third")

func filterStringsContainingLetterE(_ collection: Observable<String>) async -> [String] {
    var result: [String] = []
    
     collection
        .filter { $0.contains("e") }
        .subscribe(onNext: { str in
            result.append(str)
        }).disposed(by: DisposeBag())
    
    return result
}

func main() async {
    let filteredStrings = await filterStringsContainingLetterE(firstCollection)
    print(filteredStrings)
}

await main()

