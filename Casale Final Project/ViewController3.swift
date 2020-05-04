//
//  ViewController3.swift
//  Casale Final Project
//
//  Created by Amy Casale on 5/4/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController3: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let southRimLatitude: CLLocationDegrees = 36.0583
    let southRimLongitude: CLLocationDegrees = 112.1273
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            
            let southRim:CLLocation = CLLocation(latitude: southRimLatitude,longitude: southRimLongitude)
            let delta:CLLocationDistance = southRim.distance(from: newLocation)
            let miles: Double = (delta * 0.00621371) + 0.5
            if miles < 3 {
                locationManager.stopUpdatingLocation()
                distanceLabel.text = "Arriving to South Rim Trail in three miles."
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from:NSNumber(value: miles))!+" miles to South Rim Trail"
                
            }
        }
        

    }
    
    
    class ViewController: UIViewController {
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = 1609;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
