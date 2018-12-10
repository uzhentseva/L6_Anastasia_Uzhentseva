/*
 Игра в таможенника Трампа.
 Создаём очередь автомобилей на границе. Границу могут пройти только:
    1. автомобили из США или Канады с топливом менее 30 литров
    2. грузовики из США и Канады весом меньше 5т
 
 Если автомобиль или грузовик соответствует условиям, он проходит границу и попадает в транзитную зону.
 Если не соответствует, то попадает в карантин.
*/

import Foundation

// Начинаем игру в таможенника!

// В зону контроля подъезжают легковушки

var stackSedan = Queue<Sedan>()

stackSedan.push(Sedan(country: "США", fuel: 18))
stackSedan.push(Sedan(country: "Канада", fuel: 35))
stackSedan.push(Sedan(country: "Мексика", fuel: 5))
stackSedan.push(Sedan(country: "Мексика", fuel: 40))
print(stackSedan)

//считаем общее топливо (просто так)
print("Общий вес провезённого через границу топлива: \(stackSedan.totalFuel) \n")


// в зону контроля подъезжают грузовики

var stackTruck = QueueTruck<Truck>()

stackTruck.push(Truck(country: "США", weight: 4500))
stackTruck.push(Truck(country: "Канада", weight: 5500))
stackTruck.push(Truck(country: "Мексика", weight: 3500))
stackTruck.push(Truck(country: "Канада", weight: 2500))
print(stackTruck)

// считаем общий вес (тоже просто так)
print("Общий вес пройденного через границу груза \(stackTruck.totalWeight) \n")



// Пошла проверка на границе!

// проверяем легковушки:

func checkSedansVehicle(stackWithSedans: Queue<Sedan>) -> Queue<Sedan> {
    
    var returningTransitQueue = Queue<Sedan>()
    var returningKarantinQueue = Queue<Sedan>()
    
    for element in stackWithSedans.elements {
        if element.country == "США" || element.country == "Канада" && element.fuel < 30
        {
            returningTransitQueue.elements.append(element)
        } else {
            returningKarantinQueue.elements.append(element)
            print("В карантин попали \(returningKarantinQueue)") // сколько раз проходит, столько раз добвляет значение и выводит все попытки
        }
    }
    return returningTransitQueue;
}

print("Через границу проезжают авто: \(checkSedansVehicle(stackWithSedans: stackSedan)) \n")


// проверяем грузовики:

func checkTruckVehicle (stackWithTrucks: QueueTruck<Truck>) -> QueueTruck<Truck> {

    var returningTransitQueue = QueueTruck<Truck>()
    var returningKarantinQueue = QueueTruck<Truck>()
    
    for element in stackWithTrucks.elements {
        if element.country == "США" || element.country == "Канада" && element.weight < 5000
        {
            returningTransitQueue.elements.append(element)
        } else {
            returningKarantinQueue.elements.append(element)
            print("В карантин попали \(returningKarantinQueue)")
        }
    }
    return returningTransitQueue;
}

print("Через границу проезжают грузовики: \(checkTruckVehicle(stackWithTrucks: stackTruck)) \n")


// переходят границу и удаляются из очереди с первого элемента
stackSedan.delete()
stackTruck.delete()

print(stackSedan)
print(stackTruck)
print("\n")



