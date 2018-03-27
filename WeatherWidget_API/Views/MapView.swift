//
//  SettingsController.swift
//  WeatherWidget_API
//
//  Created by Artem on 26.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapView: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    private var coordinatesToControl: (latitude: Double, longitude: Double)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinatesToControl = WeatherModel.currentLocation
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: coordinatesToControl.latitude,
                                                       longitude: coordinatesToControl.longitude)
        mapView.addAnnotation(annotation)

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapView.handleTap(_:)))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        WeatherModel.updateData(with: coordinatesToControl)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {

        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        coordinatesToControl = (coordinate.latitude, coordinate.longitude)
        print("\(coordinate.latitude)" + " " + "\(coordinate.longitude)")
        
        mapView.removeAnnotations(mapView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}
