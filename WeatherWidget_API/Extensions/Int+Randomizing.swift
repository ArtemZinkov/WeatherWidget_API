//
//  Int+Randomizing.swift
//  WeatherWidget_API
//
//  Created by Artem on 18.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Foundation

extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
