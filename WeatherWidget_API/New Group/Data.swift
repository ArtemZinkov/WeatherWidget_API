//
//  Model.swift
//  
//
//  Created by Artem on 04.02.2018.
//

import Foundation
import CoreLocation

let KELVIN_CONSTANT = 273.15
let APIkeys =
    [
        "ce1386c86a0219f660c0b2820610c9ff",
        "d7dd893f6ba991f650de2d6b69c2f1fa"
    ]

let APIAdress = "http://api.openweathermap.org/data/2.5/weather"

var currentLocation:(lon: Double, lat: Double) {
    get {
//        let coordinate = CLLocation.init().coordinate
//        return (coordinate.latitude, coordinate.longitude)
        return (30.59, 50.45) 
    }
}
