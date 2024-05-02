import Foundation

struct FlightDTO: Codable {
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
    
    init(_ jsonData: Data) throws {
        let flights = try JSONDecoder().decode(FlightDTO.self, from: jsonData)

        id = flights.id
        airlineCode = flights.airlineCode
        lastUpdatedAt = flights.lastUpdatedAt
        flightDirection = flights.flightDirection
        flightName = flights.flightName
        flightNumber = flights.flightNumber
        scheduleDate = flights.scheduleDate
        scheduleTime = flights.scheduleTime
        serviceType = flights.serviceType
        terminal = flights.terminal
     }
}

protocol IObjectService {
    var baseURL: URL { get }
    func fetchObjects(completion: @escaping ([FlightDTO]?) -> Void)
}

class ObjectURLSessionService: IObjectService {
    var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func fetchObjects(completion: @escaping ([FlightDTO]?) -> Void) {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("ae37ec8f", forHTTPHeaderField: "app_id")
        request.addValue("20706604753769cfad9f14d1a1ebdd06", forHTTPHeaderField: "app_key")
        request.addValue("v4", forHTTPHeaderField: "ResourceVersion")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    // Парсим данные в формат JSON
                    let jsonRes = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                    
                    // Декодируем JSON в объект Flight
                    if let flightsData = jsonRes?["flights"] {
                        let jsonData = try JSONSerialization.data(withJSONObject: flightsData)
                        let flights = try JSONDecoder().decode([FlightDTO].self, from: jsonData)
                        completion(flights)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
