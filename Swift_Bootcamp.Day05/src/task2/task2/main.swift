import Foundation
import RxSwift

let firstCollection = Observable.of("first", "second", "third")

func filterStrings(_ collection: Observable<String>) async -> String? {
    var result: String?
    
    result = try? await collection
            .filter { $0.hasPrefix("th") }
            .first()
            .value
    
    return result
}

func main() async {
    let filteredStrings = await filterStrings(firstCollection)
    print("\(filteredStrings ?? "nil")")
}

await main()
