import Foundation

// Главная функция
func play() {
    // главные объекты
    let city = City(name: "Novosibirsk", phone: "88008473824")
    let zone1 = Zone(name: "Sovetsky district", info: "info", departmentСode: "123", dangerLevel: "lower", zoneType: ZoneType.circle(center: (7,7), radius: 1), phoneNumber: "123456789")
    let zone2 = Zone(name: "Kalinisky district", info: "info", departmentСode: "333", dangerLevel: "high", zoneType: ZoneType.triangle(points: [(11, 11), (12,12), (12,11)]), phoneNumber: "123456789")
    let zone3 = Zone(name: "Kirovsky district", info: "info", departmentСode: "777", dangerLevel: "lower", zoneType: ZoneType.quadrilateral(points: [(0,0),(0,-2),(-2,0),(-1,1)]), phoneNumber: "123456789")
    city.appendZone(zone1)
    city.appendZone(zone2)
    city.appendZone(zone3)

    let incident = Incident(accidentInfo: "Sasha Ivanov", description: "22 y.o.", phone: "+79347362826", incidentType: IncidentType.fire)
    
    if incident.parseCoordinates() != 1 {
        city.printInfo()
        incident.printInfo()
        city.checkIncident(incident)
    } else {
        print("Error Input")
    }
}


play()
