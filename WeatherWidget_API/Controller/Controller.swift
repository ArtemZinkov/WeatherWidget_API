//
//  Controller.swift
//  WeatherWidget_API
//
//  Created by Artem on 11.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import SwiftyJSON
import Alamofire

protocol WeatherProtocol {
    func setWeather(from model: WeatherModel)
}

class WeatherController:UIViewController {
    var weatherModel = WeatherModel()
    var weatherView: WeatherProtocol!
    
    var json:JSON! {
        didSet {
            weatherModel.setModel(from: json)
            weatherView.setWeather(from: weatherModel)
        }
    }
    
    func initiate() {
        setJSON(from: weatherModel.getRequestAdress())
    }
    
    func setJSON(from string:String) {
        Alamofire.request(string).responseJSON { response in
            if let jsonValue = response.result.value {
                DispatchQueue.main.async {
                    self.json = JSON(jsonValue)
                }
            }
        }
    }
}
