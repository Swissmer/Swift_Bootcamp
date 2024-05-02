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

func filterStrings(_ collection: Observable<Sample>) async -> [Int: [String]] {
    var result: [Int: [String]] = [:]
    
    _ = collection
        .groupBy { $0.id }
        .flatMap { group in
            return group
                .map { $0.text }
                .toArray()
                .map { texts in
                    (group.key, texts)
                }
        }
        .subscribe(onNext: { (id, texts) in
            result[id] = texts
        }).disposed(by: DisposeBag())
    
    return result
}

func main() async {
    let filteredStrings = await filterStrings(secondCollection)
    print(filteredStrings)
}

await main()
