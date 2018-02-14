//
//  Extensions.swift
//  WeatherWidget_API
//
//  Created by Artem on 05.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Foundation

extension Int {
    func Random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

extension Double {
    func Subtract(_ double:Double) -> Double {
        return self - double
    }
}
