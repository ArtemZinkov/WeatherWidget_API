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
    
    private var controller: WeatherController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = WeatherController()
        controller.weatherView = self
        controller.initiate()
    }

    private func setTemperatureLabel(with text: String) {
        temp.text = text
    }
    
    private func setPlace(with text: String) {
        place.text = text
    }
    
    private func setDescription(with text: String) {
        descr.text = text
    }
    
    func setWeather(from object: WeatherModel) {
        setTemperatureLabel(with: object.temperature)
        setPlace(with: object.location)
        setDescription(with: object.currentWeather)
    }
}







