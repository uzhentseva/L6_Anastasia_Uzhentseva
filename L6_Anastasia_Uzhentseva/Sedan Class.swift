//
//  NormalCar Class.swift
//  L6_Anastasia_Uzhentseva
//
//  Created by Uzh on 09/12/2018.
//  Copyright © 2018 Uzh. All rights reserved.
//

import Foundation

// создаём классы машин Седан

class Sedan: Country, Fuelable {
    
    var country: String
    var fuel: Double
    
    init(country: String, fuel: Double) {
        self.country = country
        self.fuel = fuel

    }
    
    func checkFuel () -> String {
        
        if self.fuel < 30 && self.fuel > 0 {
            return "Допустимый уровень топлива"
        } else {
            return "Уровень топлива превышает допустимый"
        }
    }
    
}

extension Sedan : CustomStringConvertible {
    var description : String {
        return "[страна: \(self.country), топлива: \(self.fuel) л.]"
    }
}
