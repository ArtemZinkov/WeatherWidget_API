//
//  Model.swift
//  WeatherWidget_API
//
//  Created by Artem on 12.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherModel {
    var location: String!
    var temperature: String!
    var currentWeather: String!
    
    let temperaturePrefix = "Поточна температура: "
    
    static var currentLocation:(longitude: Double, latitude: Double) {
        get {
            return (30.59, 50.45)
        }
    }
    
    private func setPlace(with text: String) {
        location = text
    }
    
    private func setDescription(with text: String) {
        currentWeather = text
    }
    
    private func setTemperatureLabel(with text: String) {
        temperature = temperaturePrefix + text + "℃"
    }

    func setModel(from json: JSON) {
        setPlace(with: json["name"].stringValue)
        setTemperatureLabel(with: String(Double(Int(json["main"]["temp"].doubleValue.subtract(Constants.kelvinConstant)))))
        setDescription(with: getDescription(from: json))
    }
    
    private func getDescription(from json: JSON) -> String {
        var descriptionString = ""
        let jsonArray = json["weather"].arrayValue
        
        for jsonDict in jsonArray {
            descriptionString.append(jsonDict["description"].stringValue + ", ")
        }
        
        if Int(descriptionString.count) >= 2 {
            descriptionString.removeLast(2)
        }
        return descriptionString
    }
    
    func getRequestAdress() -> String {
        return Constants.apiAdress + "?lat=" + String(WeatherModel.currentLocation.latitude) + "&lon=" + String(WeatherModel.currentLocation.longitude) + "&appid=" + Constants.apiKeys[Constants.apiKeys.count.random()]
    }
}
