import Foundation
import SwiftUI
import Alamofire

// MARK: - Сетевой уровень (Удалённый)
protocol NetworkService {
    func getRecipes(completion: @escaping ([Recipes]) -> Void)
}

class NetworkServiceImpl: NetworkService {
    func getRecipes(completion: @escaping ([Recipes]) -> Void) {
        AF.request("https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes",
                       method: .get, headers: [
                        "X-RapidAPI-Key": "a25485bfabmshecee9daa0bc78dcp19456ajsn1e21079292af",
                        "X-RapidAPI-Host": "tasty.p.rapidapi.com"
                       ]
        ).responseDecodable(of: RecipesResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(data.results)
            case .failure(let error):
                completion([])
                print(error)
            }
        }
    }
}
