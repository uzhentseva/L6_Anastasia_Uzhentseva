//
//  TrunkCar Class.swift
//  L6_Anastasia_Uzhentseva
//
//  Created by Uzh on 09/12/2018.
//  Copyright © 2018 Uzh. All rights reserved.
//

import Foundation

// создаём класс Грузовик

class Truck: Country, Weightable {
    var country: String
    var weight: Double
    
    init(country: String, weight: Double) {
        self.country = country
        self.weight = weight
    }
    
    func checkWeight () -> Bool {
        
        if self.weight < 5000 && self.weight > 0 {
            print("Допустимый вес")
            return true

        } else {
            print("Вес превышает допустимый")
            return false
            
        }
    } 
    
    
}

extension Truck : CustomStringConvertible {
    var description : String {
        return "[страна: \(self.country), вес: \(self.weight) л.]"
    }
}
