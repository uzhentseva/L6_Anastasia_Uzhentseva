import Foundation

// создаём класс Грузовик

class Truck: Country, Weightable {
    var country: String
    var weight: Double
    
    init(country: String, weight: Double) {
        self.country = country
        self.weight = weight
    }
}

extension Truck : CustomStringConvertible {
    var description : String {
        return "[страна: \(self.country), вес: \(self.weight) л.]"
    }
}
