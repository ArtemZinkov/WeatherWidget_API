//
//  ViewController.swift
//  WeatherWidget_API
//
//  Created by Artem on 08.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet private weak var place: UILabel!
    @IBOutlet private weak var temp: UILabel!
    @IBOutlet private weak var descr: UILabel!
    
    func SetTemperatureLabel(with text: String) {
        temp.text = "Поточна температура: " + text + "℃"
    }
    
    func SetPlace(with text:String) {
        place.text = text
    }
    
    func SetDescription(with text:String) {
        descr.text = text
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherJSON()
    }

    func getWeatherJSON() {
        
        let requestAdress = APIAdress + "?lat=" + String(currentLocation.lat) + "&lon=" + String(currentLocation.lon) + "&appid=" + APIkeys[APIkeys.count.Random()]
        print(requestAdress)
        
        guard let url = URL(string: requestAdress) else {
            print("Didn't get it with API :(")
            return
        }
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.SetWeather(with: json)
            case .failure(let error):
                print(error)
                print("Didn't get JSON")
            }
        }
    }
    
    func SetWeather(with json:JSON) {
        SetTemperatureLabel(with: String(json["main"]["temp"].doubleValue.Subtract(KELVIN_CONSTANT)))
        SetPlace(with: json["name"].stringValue)
        
        var descriptionString = ""
        let jsonArray = json["weather"].arrayValue
        for jsonDict in jsonArray {
            descriptionString.append(jsonDict["description"].stringValue + ", ")
        }
        
        if Int(descriptionString.count) >= 2 {
            descriptionString.removeLast(2)
        }
        SetDescription(with: descriptionString)
    }
}







