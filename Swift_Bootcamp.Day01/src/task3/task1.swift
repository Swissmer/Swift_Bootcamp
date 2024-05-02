import Foundation

// перечисление типов инцидентов
enum IncidentType: String {
    case fire = "fire"
    case gasLeak = "gas leak"
    case catOnTheTree = "cat on the tree"
}

// перечисление типов зон
enum ZoneType {
    case circle(center: (Int, Int), radius: Int)
    case triangle(points: [(Int, Int)])
    case quadrilateral(points: [(Int, Int)])
}

// класс инцидента
class Incident {
    // главные переменные класса
    var accidentInfo: String?
    var description: String?
    var phone: String?
    var incidentType: IncidentType?
    var coordinates: (Int, Int)?
    
    // инизиализация
    init(accidentInfo: String? = nil, description: String? = nil, phone: String? = nil, incidentType: IncidentType? = nil, coordinates: (Int, Int)? = nil) {
        self.accidentInfo = accidentInfo
        self.description = description
        self.phone = phone
        self.incidentType = incidentType
        self.coordinates = coordinates
    }
    
    // чтение данных
    func readInfo() -> Int  {
        var error = 0
        if parseCoordinates() == 1 || parseAccidentInfo() == 1 || parseDescription() == 1 || parsePhone() == 1 || parseType() == 1 {
            error = 1
            print("Error Input")
            setNil()
        }
        
        return error
    }
    
    // вывод информации
    func printInfo() {
        print("\nThe accident info: \(accidentInfo!)")
        print("\tDescription: \(description!)")
        print("\tPhone number: \(phone!)")
        print("\tType: \(incidentType!)\n")
    }
    
    // установить значение по умолчанию
    func setNil () {
        accidentInfo = nil
        description = nil
        phone = nil
        incidentType = nil
        coordinates = nil
    }
    
    // парсер информации
    func parseAccidentInfo() -> Int {
        let error = 0
        print("Enter the accident info:")
        accidentInfo = readLine()!
        return error
    }
    
    // парсер типа инцидента
    func parseType() -> Int {
        var error = 0
        print("Enter type: (fire, gas leak, cat on the tree)")
        let input = readLine()!
        switch input {
        case "fire":
            incidentType = IncidentType.fire
        case "gas leak":
            incidentType = IncidentType.gasLeak
        case "cat on the tree":
            incidentType = IncidentType.catOnTheTree
        default:
            error = 1
        }
        return error
    }
    
    // парсер телефона
    func parsePhone() -> Int {
        let error = 0
        print("Enter phone number: ")
        phone = readLine()!
        phone = phone?.applyPhoneMask()
        return error
    }
    
    // парсер описания
    func parseDescription() -> Int {
        let error = 0
        print("Enter description: ")
        description = readLine()!
        return error
    }
    
    // парсер координат
    func parseCoordinates () -> Int {
        var error = 0
        print("Enter an accident coordinates: ")
        let input = readLine()!
        coordinates = parsePoint(input)
        if coordinates == nil {
            error = 1
        }
        return error
    }
    
    // парсер точки
    func parsePoint (_ input: String) -> (Int, Int)? {
        let coordinates = input.components(separatedBy: ";")
        if coordinates.count == 2, let x = Int(coordinates[0]), let y = Int(coordinates[1]) {
            return (x, y)
        }
        return nil
    }
}

// класс зоны
class Zone {
    // главные переменные класса
    var name: String?
    var info: String?
    var departmentСode: String?
    var dangerLevel: String?
    var zoneType: ZoneType?
    var phoneNumber: String?
    
    init(name: String? = nil, info: String? = nil, departmentСode: String? = nil, dangerLevel: String? = nil, zoneType: ZoneType? = nil, phoneNumber: String? = nil) {
        self.name = name
        self.info = info
        self.departmentСode = departmentСode
        self.dangerLevel = dangerLevel
        self.zoneType = zoneType
        self.phoneNumber = phoneNumber
    }
    

    // получение информации
    func readInfo() -> Int {
        var error = 0
        if parseZone() == 1 || parseInfo() == 1 || parsePhoneNumber() == 1 || parseName() == 1 || parseDepartmentСode() == 1 || parseDagerLevel() == 1 {
            error = 1
            print("Error Input")
            setNil();
        }
        return error
    }
    
    // проверяет на область
    func checkIncident(_ data: Incident) -> (Int, Bool, Double) {
        var error: Int = 0
        var result: Bool = false
        var distance: Double? = 0
        
        switch zoneType {
        case .circle(let center, let radius):
            let centerArray = [center.0, center.1]
            let radiusArray = [radius]
            // check Zone
            result = checkCircle(px: centerArray[0], py: centerArray[1], x1: data.coordinates!.0, y1: data.coordinates!.1, r: radiusArray[0])
            
            // distance
            distance = distanceToCircleBoundary(px: centerArray[0], py: centerArray[1], centerX: data.coordinates!.0, centerY: data.coordinates!.1, radius: radiusArray[0])
        case .triangle(let points):
            let pointsArray = points.map { [$0.0, $0.1] }
            // check Zone
            result = checkTriangle(px: data.coordinates!.0, py: data.coordinates!.1, x1: pointsArray[0][0], y1: pointsArray[0][1], x2: pointsArray[1][0], y2: pointsArray[1][1], x3: pointsArray[2][0], y3: pointsArray[2][1])
            
            // distance
            distance = distanceToTriangleBoundary(px: data.coordinates!.0, py: data.coordinates!.1, x1: pointsArray[0][0], y1: pointsArray[0][1], x2: pointsArray[1][0], y2: pointsArray[1][1], x3: pointsArray[2][0], y3: pointsArray[2][1])
        case .quadrilateral(let points):
            let pointsArray = points.map { [$0.0, $0.1] }
            // check Zone
            result = checkQuadrilateral(px: data.coordinates!.0, py: data.coordinates!.1, x1: pointsArray[0][0], y1: pointsArray[0][1], x2: pointsArray[1][0], y2: pointsArray[1][1], x3: pointsArray[2][0], y3: pointsArray[2][1], x4: pointsArray[3][0], y4: pointsArray[3][1])
            
            // distance
            distance = distanceToQuadrilateralBoundary(px: data.coordinates!.0, py: data.coordinates!.1, x1: pointsArray[0][0], y1: pointsArray[0][1], x2: pointsArray[1][0], y2: pointsArray[1][1], x3: pointsArray[2][0], y3: pointsArray[2][1], x4: pointsArray[3][0], y4: pointsArray[3][1])
        default:
            error = 1
        }
        
        return (error, result, distance!)
    }
    
    // подсчёт расстояния для круга
    func distanceToCircleBoundary(px: Int, py: Int, centerX: Int, centerY: Int, radius: Int) -> Double {
        let distance = sqrt(pow(Double(px - centerX), 2) + pow(Double(py - centerY), 2)) - Double(radius)
        return max(distance, 0)
    }

    // подсчёт расстояния для треугольника
    func distanceToTriangleBoundary(px: Int, py: Int, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int) -> Double {
        let distances = [
            distanceToSegment(px: px, py: py, x1: x1, y1: y1, x2: x2, y2: y2),
            distanceToSegment(px: px, py: py, x1: x2, y1: y2, x2: x3, y2: y3),
            distanceToSegment(px: px, py: py, x1: x3, y1: y3, x2: x1, y2: y1)
        ]
        return distances.min()!
    }

    // подсчёт расстояния для четырёхугольника
    func distanceToQuadrilateralBoundary(px: Int, py: Int, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, x4: Int, y4: Int) -> Double {
        let distances = [
            distanceToSegment(px: px, py: py, x1: x1, y1: y1, x2: x2, y2: y2),
            distanceToSegment(px: px, py: py, x1: x2, y1: y2, x2: x3, y2: y3),
            distanceToSegment(px: px, py: py, x1: x3, y1: y3, x2: x4, y2: y4),
            distanceToSegment(px: px, py: py, x1: x4, y1: y4, x2: x1, y2: y1)
        ]
        return distances.min()!
    }

    
    // подсчёт расстояния для грани
    func distanceToSegment(px: Int, py: Int, x1: Int, y1: Int, x2: Int, y2: Int) -> Double {
        let dx = x2 - x1
        let dy = y2 - y1

        let dotProduct = (px - x1) * dx + (py - y1) * dy
        let segmentLengthSquared = dx * dx + dy * dy

        var t = dotProduct / segmentLengthSquared

        if t < 0 {
            t = 0
        } else if t > 1 {
            t = 1
        }

        let nearestX = x1 + t * dx
        let nearestY = y1 + t * dy

        let distance = sqrt(pow(Double(px - nearestX), 2) + pow(Double(py - nearestY), 2))
        return distance
    }
    
    // вывод информации
    func printInfo() {
        print("The zone info:")
        print("\tThe shape of area: \(zoneType!)")
        print("\tPhone number: \(phoneNumber!)")
        print("\tName: \(name!)")
        print("\tEmergency dept: \(departmentСode!)")
        print("\tDanger level: \(dangerLevel!)")
    }
    
    // в пределах круга
    func checkCircle(px: Int, py: Int, x1: Int, y1: Int, r: Int) -> Bool {
        let distance: Double = sqrt(pow(Double(px - x1), 2) + pow(Double(py - y1), 2))
        return distance < Double(r)
    }
    
    // в пределах треугольника
    func checkTriangle (px: Int, py: Int, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int) -> Bool  {
        let b1 = sign(px, py, x1, y1, x2, y2) < 0
        let b2 = sign(px, py, x2, y2, x3, y3) < 0
        let b3 = sign(px, py, x3, y3, x1, y1) < 0
        
        return ((b1 == b2) && (b2 == b3))
    }
    
    // в пределах четырёхугольника
    func checkQuadrilateral(px: Int, py: Int, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, x4: Int, y4: Int) -> Bool {
        let sign1 = sign(px, py, x1, y1, x2, y2) < 0
        let sign2 = sign(px, py, x2, y2, x3, y3) < 0
        let sign3 = sign(px, py, x3, y3, x4, y4) < 0
        let sign4 = sign(px, py, x4, y4, x1, y1) < 0
        
        return (sign1 == sign2) && (sign2 == sign3) && (sign3 == sign4)
    }
    
    // определение границы
    func sign(_ px: Int, _ py: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
        return (px - x2) * (y1 - y2) - (x1 - x2) * (py - y2)
    }
    
    // установить значение по умолчанию
    func setNil () {
        name = nil
        info = nil
        departmentСode = nil
        dangerLevel = nil
        zoneType = nil
        phoneNumber = nil
    }
    
    // парсер информации
    func parseDepartmentСode() -> Int {
        let error = 0
        print("Enter emergency dept: ")
        departmentСode = readLine()!
        return error
    }
    
    // парсер имени
    func parseName () -> Int {
        let error = 0
        print("Enter name:")
        name = readLine()!
        return error
    }
    
    // парсер телефона
    func parsePhoneNumber() -> Int{
        let error = 0
        print("Enter phone number: ")
        phoneNumber = readLine()!
        phoneNumber = phoneNumber?.applyPhoneMask()
        return error
    }
    
    // парсер информации
    func parseInfo() -> Int {
        let error = 0
        print("Enter the zone info:")
        info = readLine()!
        return error
    }
    
    // парсер уровня опастности
    func parseDagerLevel() -> Int {
        var error = 0
        print("Enter danger level: (lower, medium, high)")
        dangerLevel = readLine()!
        switch dangerLevel {
        case "lower", "medium", "high":
            error = 0
        default:
            error = 1
        }
        return error
    }
    
    // парсер зоны
    func parseZone() -> Int {
        print("Enter zone parameters:")
        let input = readLine()!
        var error: Int = 0
        let components = input.components(separatedBy: " ")
        
        switch components.count {
        case 2:
            if let center = self.parsePoint(components[0]), let radius = Int(components[1]) {
                zoneType = ZoneType.circle(center: center, radius: radius)
            }
        case 3:
            let points = components.compactMap { parsePoint($0) }
            if points.count == 3 {
                zoneType = ZoneType.triangle(points: points)
            }
        case 4:
            let points = components.compactMap { parsePoint($0) }
            if points.count == 4 {
                zoneType = ZoneType.quadrilateral(points: points)
            }
        default:
            zoneType = nil
        }
        
        if zoneType == nil {
            error = 1
        }
        
        return error
    }
    
    // парсер координаты
    func parsePoint (_ input: String) -> (Int, Int)? {
        let coordinates = input.components(separatedBy: ";")
        if coordinates.count == 2, let x = Int(coordinates[0]), let y = Int(coordinates[1]) {
            return (x, y)
        }
        return nil
    }
    
}
