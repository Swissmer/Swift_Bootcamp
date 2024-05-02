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

func filterStrings(_ collection: Observable<Sample>) async -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    
    _ = collection
        .groupBy { $0.id }
        .flatMap { group in
            return group
                .toArray()
                .map { count in
                    (group.key, count.count)
                }
        }
        .subscribe(onNext: { (id, count) in
            result.append((id, count))
        }).disposed(by: DisposeBag())
    
    return result
}




func main() async {
    let filteredStrings = await filterStrings(secondCollection)
    print(filteredStrings)
}

await main()
