import Foundation
import Alamofire

struct FlightDTO: Decodable {
    let id: String
    let airlineCode: Int?
    let lastUpdatedAt: String
    let flightDirection: String
    let flightName: String
    let flightNumber: Int
    let scheduleDate: String
    let scheduleTime: String
    let serviceType: String
    let terminal: Int?
}

protocol IObjectService {
    var baseURL: URL { get }
    func fetchObjects(completion: @escaping ([FlightDTO]?) -> Void)
}

class ObjectAlamofireService: IObjectService {
    var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func fetchObjects(completion: @escaping ([FlightDTO]?) -> Void) {
           AF.request(baseURL, method: .get, headers: [
               "Accept": "application/json",
               "app_id": "ae37ec8f",
               "app_key": "20706604753769cfad9f14d1a1ebdd06",
               "ResourceVersion": "v4"
           ]).responseDecodable(of: [String: [FlightDTO]].self) { response in
               switch response.result {
               case .success(let data):
                   if let flightsData = data["flights"] {
                       completion(flightsData)
                   } else {
                       print("No 'flights' key found in response")
                       completion(nil)
                   }
               case .failure(let error):
                   print("Request failed with error: \(error)")
                   completion(nil)
               }
           }
       }

}
