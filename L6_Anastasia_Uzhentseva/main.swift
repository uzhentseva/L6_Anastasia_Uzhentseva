//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import Foundation

// Создаём очередь автомобилей на границе.
// Границу могут пройти только:
// 1. автомобили из США или Канады
// 2. грузовики весом меньше 5т
// Если автомобиль или грузовик соответствует условиям, он проходит границу и попадает в транзитную зону. Если не соответствует, то попадает в карантин.

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
    
    private var elements: [T] = []
    
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
    
    private var elements: [T] = []
    
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

// в зону контроля подъезжают легковушки

var stackSedan = Queue<Sedan>()

stackSedan.push(Sedan(country: "США", fuel: 18))
//print(stackSedan)
stackSedan.push(Sedan(country: "Канада", fuel: 10))
//print(stackSedan)
stackSedan.push(Sedan(country: "Мексика", fuel: 5))
//print(stackSedan)
stackSedan.push(Sedan(country: "Мексика", fuel: 40))
print(stackSedan)
print("Общий вес провезённого через границу топлива: \(stackSedan.totalFuel) \n")

// в зону контроля подъезжают грузовики

var stackTruck = QueueTruck<Truck>()

stackTruck.push(Truck(country: "США", weight: 4500))
//print(stackTruck)
stackTruck.push(Truck(country: "Канада", weight: 5500))
//print(stackTruck)
stackTruck.push(Truck(country: "Мексика", weight: 3500))
//print(stackTruck)
stackTruck.push(Truck(country: "Канада", weight: 2500))
print(stackTruck)
print("Общий вес пройденного через границу груза \(stackTruck.totalWeight) \n")

// проверяем машины на границе

//var checkVehicle: Bool {
//    if Sedan.country == "США" || Sedan.country == "Канада" {
//        return true
//    } else {
//        return false
//    }
//}




// проезжают по одной машине переходя границу и удаляются из очереди
stackSedan.delete()
stackTruck.delete()

print(stackSedan)
print(stackTruck)


//
//
//// проверяем вес грузовиков
//let weightCheck: (Double) -> Bool = { (element: Double) -> Bool in
//    return element > 0 && element < 5000
//}
//
//// проверка страны принадлежности
//let countryCheck: (String) -> Bool = { (element: String) -> Bool in
//    return element == "США" || element == "Канада"
//}
//

//
//
//var array = [1,2,3,4,5,6,7,8,9,10]
//
//// принимает два аргумента – массив и замыкание
//
//func filter(array: [Int], predicate: (Int) -> Bool ) -> [Int] {
//    var tmpArray = [Int]()               // создает временный массив
//    for element in array {
//        if predicate(element) {         // вызываем замыкание, чтобы проверить элемент
//            tmpArray.append(element)
//        }
//    }
//    return tmpArray                     // возвращаем отфильтрованный массив
//}
//filter(array: array, predicate: weightCheck)
//filter(array: array, predicate: countryCheck)
//
