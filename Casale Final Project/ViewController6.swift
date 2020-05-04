//
//  ViewController6.swift
//  Casale Final Project
//
//  Created by Amy Casale on 5/4/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import WebKit

class ViewController6: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBAction func openWebsite(_ sender: Any) {
        
        if let url = URL(string: "https://www.kalalautrail.com/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.kalalautrail.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
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
