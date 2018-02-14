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

class ViewController: UIViewController, WeatherProtocol {

    @IBOutlet private weak var place: UILabel!
    @IBOutlet private weak var temp: UILabel!
    @IBOutlet private weak var descr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = WeatherController()//storyboard?.instantiateViewController(withIdentifier: "WeatherController") as! WeatherController
        controller.weatherView = self
        controller.initiate()
    }

    func setTemperatureLabel(with text: String) {
        temp.text = text
    }
    
    func setPlace(with text:String) {
        place.text = text
    }
    
    func setDescription(with text:String) {
        descr.text = text
    }
    
    func setWeather(from object:WeatherModel) {
        setTemperatureLabel(with: object.temperature)
        setPlace(with: object.location)
        setDescription(with: object.currentWeather)
    }
}







