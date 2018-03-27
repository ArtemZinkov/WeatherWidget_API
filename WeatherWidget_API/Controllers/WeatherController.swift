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
    func clearView()
}

class WeatherController: UIViewController {
    private var weatherModel = WeatherModel()
    var weatherView: WeatherProtocol!
    
    private var json:JSON! {
        didSet {
            weatherModel.setModel(from: json)
            weatherView.setWeather(from: weatherModel)
        }
    }
    
    func initiate() {
        weatherView.clearView()
        weatherModel.fetchDataFromCoreData()
        setJSON(from: weatherModel.getRequestAdress())
    }
    
    private func setJSON(from string: String) {
        Alamofire.request(string).responseJSON { response in
            if let jsonValue = response.result.value {
                DispatchQueue.main.async {
                    self.json = JSON(jsonValue)
                }
            }
        }
    }
}
