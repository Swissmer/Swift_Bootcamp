import Foundation

let url = URL(string: "https://api.schiphol.nl/public-flights/flights")
let objService = ObjectURLSessionService(baseURL: url!)

objService.fetchObjects { flights in
    if let flights = flights {
        for flight in flights {
            print(flight)
        }
    }
}

dispatchMain()
