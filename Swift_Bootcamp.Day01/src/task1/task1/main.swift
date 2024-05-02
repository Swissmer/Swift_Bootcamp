import Foundation

// главная функция
func play() {
    if zone.readInfo() == 0 && incident.readInfo() == 0 {
        if zone.checkIncident(incident) != 0 {
            print("read incident Error!")
        }
    }
}

// главные объекты
var zone = Zone()
var incident = Incident()

play()

