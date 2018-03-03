//
//  SettingsModel.swift
//  WeatherWidget_API
//
//  Created by Artem on 26.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Foundation	

struct SettingsModel {
    
    let isCurrentPosition: Bool
    static var positionToMonitor: (Double, Double) = WeatherModel.currentLocation
    
    func setPositionToMonitor(with coordinates: (Double, Double)) {
        SettingsModel.positionToMonitor = coordinates
    }
    
    func checkPositionSettings() {
        
    }
    
}
