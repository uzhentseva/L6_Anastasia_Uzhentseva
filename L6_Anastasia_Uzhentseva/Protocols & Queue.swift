import Foundation

protocol Country {
    var country: String {get set}
}

protocol Weightable {
    var weight: Double {get set}
}

protocol Fuelable {
    var fuel: Double {get set}
}

// Создаём очередь седанов
struct Queue <T: Fuelable> {
    
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func delete() -> T? {
        return elements.removeFirst()
    }
    
    // подсчитываем общий объём перевезенного топлива
    var totalFuel : Double {
        var fuel = 0.0
        for element in elements {
            fuel += element.fuel
        }
        return fuel
    }
}

// Создаём чередь грузовиков
struct QueueTruck <T: Weightable> {
    
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func delete() -> T? {
        return elements.removeFirst()
    }
    
    // подсчитываем общий вес груза
    var totalWeight : Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
}
