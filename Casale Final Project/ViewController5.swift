//
//  ViewController5.swift
//  Casale Final Project
//
//  Created by Amy Casale on 5/4/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController5: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locationManager: CLLocationManager = CLLocationManager()
       var startLocation: CLLocation!
       
    let kalalauTrailLatitude: CLLocationDegrees = 22.196086
    let kalalauTrailLongitude: CLLocationDegrees = -159.620324
       
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           
           let newLocation: CLLocation=locations[0]
           NSLog("Something is happening")
           
           if newLocation.horizontalAccuracy >= 0 {
               
               let kalalauTrail:CLLocation = CLLocation(latitude: kalalauTrailLatitude,longitude: kalalauTrailLongitude)
               let delta:CLLocationDistance = kalalauTrail.distance(from: newLocation)
               let miles: Double = (delta * 0.00621371) + 0.5
               if miles < 3 {
                   locationManager.stopUpdatingLocation()
                   distanceLabel.text = "Arriving to Kalalau Trail in three miles."
               } else {
                   let commaDelimited: NumberFormatter = NumberFormatter()
                   commaDelimited.numberStyle = NumberFormatter.Style.decimal
                   distanceLabel.text=commaDelimited.string(from:NSNumber(value: miles))!+" miles to Kalalau Trail"
                   
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
