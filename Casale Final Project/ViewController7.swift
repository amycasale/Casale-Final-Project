//
//  ViewController7.swift
//  Casale Final Project
//
//  Created by Amy Casale on 5/4/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController7: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locationManager: CLLocationManager = CLLocationManager()
       var startLocation: CLLocation!
       
    let highlineTrailLatitude: CLLocationDegrees = 48.69657
    let highlineTrailLongitude: CLLocationDegrees = -113.71813
       
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           
           let newLocation: CLLocation=locations[0]
           NSLog("Something is happening")
           
           if newLocation.horizontalAccuracy >= 0 {
               
               let highlineTrail:CLLocation = CLLocation(latitude: highlineTrailLatitude,longitude: highlineTrailLongitude)
               let delta:CLLocationDistance = highlineTrail.distance(from: newLocation)
               let miles: Double = (delta * 0.00621371) + 0.5
               if miles < 3 {
                   locationManager.stopUpdatingLocation()
                   distanceLabel.text = "Arriving to Highline Trail in three miles."
               } else {
                   let commaDelimited: NumberFormatter = NumberFormatter()
                   commaDelimited.numberStyle = NumberFormatter.Style.decimal
                   distanceLabel.text=commaDelimited.string(from:NSNumber(value: miles))!+" miles to Highline Trail"
                   
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
        startLocation = nil
   
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
