import Foundation

// создаём классы машин Седан

class Sedan: Country, Fuelable {
    
    var country: String
    var fuel: Double
    
    init(country: String, fuel: Double) {
        self.country = country
        self.fuel = fuel
    }
}

extension Sedan : CustomStringConvertible {
    var description : String {
        return "[страна: \(self.country), топливо: \(self.fuel) л.]"
    }
}
