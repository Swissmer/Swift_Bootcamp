import Foundation

class BaristaMachine : IBarista {
    var name: String
    var time_300: Int = 2
    
    init(name: String) {
        self.name = name
    }
    
    func brew(with coffee: Coffee) {
        print("Coffee \(coffee.name!) is brewing. One \(time_300) - time left")
        print("Coffee \(coffee.name!) is ready!")
    }
}
