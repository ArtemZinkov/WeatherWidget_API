//
//  Model.swift
//  WeatherWidget_API
//
//  Created by Artem on 12.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class WeatherModel {
    var location: String!
    var temperature: String!
    var currentWeather: String!
    
    private static var managedObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var coordinatesArray = [Coordinates]()
    private static var coordinates: (latitude: Double, longitude: Double)!

    let temperaturePrefix = "Поточна температура: "
    
    static var currentLocation:(latitude: Double, longitude: Double) {
        get {
            if let coordinates = WeatherModel.coordinates {
                return coordinates
            } else {
                return (0.0, 0.0)
            }
        }
    }
    
    func fetchDataFromCoreData() {
        
        let coordinatesRequest: NSFetchRequest<Coordinates> = Coordinates.fetchRequest()
        do {
            try coordinatesArray = WeatherModel.managedObject.fetch(coordinatesRequest)
            print(coordinatesArray.count)
            if coordinatesArray.count > 0 {
                let lastEnteredCoordinates = coordinatesArray[coordinatesArray.count - 1]
                coordinatesArray.removeAll()
                coordinatesArray.append(lastEnteredCoordinates)
                WeatherModel.coordinates = (latitude: lastEnteredCoordinates.latitude,
                                            longitude: lastEnteredCoordinates.longitude)
            } else {
                WeatherModel.coordinates = (latitude: 30.59,
                                            longitude: 50.45)
            }
        } catch {
            print(error.localizedDescription)
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
    
    static func updateData(with newCoordinates: (longitude: Double, latitude: Double)) {
        
        let coordinates = Coordinates(context: managedObject)
        coordinates.latitude = newCoordinates.latitude
        coordinates.longitude = newCoordinates.longitude
        
        do {
            try managedObject.save()
            WeatherModel.coordinates = newCoordinates
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
