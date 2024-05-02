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
}

protocol IObjectService {
    var baseURL: URL { get }
    func fetchObjects(completion: @escaping (FlightDTO?) -> Void)
}
