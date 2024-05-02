import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

let secondCollection = Observable.of(
        Sample(id: 1, text: "some text"),
        Sample(id: 1, text: "any text"),
        Sample(id: 2, text: "more text"),
        Sample(id: 2, text: "other text"),
        Sample(id: 3, text: "too text")
)

func filterStrings(_ collection: Observable<Sample>) async -> [String] {
    var result: [String] = []
    
    _ = collection.subscribe{ tmp in
        result.append(tmp.text)
    }.disposed(by: DisposeBag())
    
    return result
}

func main() async {
    let filteredStrings = await filterStrings(secondCollection)
    print(filteredStrings)
}

await main()
