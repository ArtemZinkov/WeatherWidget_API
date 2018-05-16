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

class WeatherView: UIViewController, WeatherProtocol {

    private var place: UILabel!
    private var temp: UILabel!
    private var descr: UILabel!

    private var controller: WeatherController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        controller = WeatherController()
        controller.weatherView = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        controller.initiate()
    }
    
    private func setupUI() {
        place = UILabel(frame: CGRect.zero)
        temp = UILabel(frame: CGRect.zero)
        descr = UILabel(frame: CGRect.zero)
        
        place.textAlignment = .center
        temp.textAlignment = .center
        descr.textAlignment = .center

        view.backgroundColor = .white

        let stackView = UIStackView(frame: view.bounds)
        stackView.addArrangedSubview(place)
        stackView.addArrangedSubview(temp)
        stackView.addArrangedSubview(descr)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor)
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor)
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor)

        view.addSubview(stackView)
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
    
    func clearView() {
        temp.text = ""
        place.text = ""
        descr.text = ""
    }
    
    func setWeather(from object: WeatherModel) {
        setTemperatureLabel(with: object.temperature)
        setPlace(with: object.location)
        setDescription(with: object.currentWeather)
    }
}

