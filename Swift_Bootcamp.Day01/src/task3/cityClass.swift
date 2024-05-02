// класс города
class City {
    // переменные
    var name: String?
    var phone: String?
    var zones: [Zone] = []
    
    // инициализация
    init(name: String? = nil, phone: String? = nil, zones: [Zone] = []) {
        self.name = name
        self.phone = phone?.applyPhoneMask()
        self.zones = zones
    }
    
    // добаваить зону
    func appendZone(_ data: Zone) {
        zones.append(data)
    }
    
    // проверка инцидента
    func checkIncident(_ data: Incident) {
           var arrDistance: [Double] = []
           var result: Zone?
           for item in zones {
               let (_, isHier, distance) = item.checkIncident(data)
               if isHier == true {
                   result = item
                   print("(В этой зоне) ", terminator: "")
                   item.printInfo()
                   break
               }
               arrDistance.append(distance)
           }
           if result == nil {
               let minDistanceIndex = arrDistance.indices.min(by: { arrDistance[$0] < arrDistance[$1] })
               print("(Прижайшая зона) ", terminator: "")
               zones[minDistanceIndex!].printInfo()
           }
           
       }

    // вывод информации о городе
    func printInfo() {
        print("The city info:")
        print("\tName: \(name!)")
        print("\tThe common number: \(phone!)")
    }
}
