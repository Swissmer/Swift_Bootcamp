import Foundation
import Alamofire

let url = URL(string: "https://api.schiphol.nl/public-flights/flights")
let objService = ObjectAlamofireService(baseURL: url!)

objService.fetchObjects { flights in
    if let flights = flights {
        for flight in flights {
            print(flight)
        }
    }
}

dispatchMain()
