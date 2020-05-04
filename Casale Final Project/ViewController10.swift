//
//  ViewController10.swift
//  Casale Final Project
//
//  Created by Amy Casale on 5/4/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import MessageUI

class ViewController10: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBAction func sendText(_ sender: Any) {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self as
        MFMessageComposeViewControllerDelegate
        
        composeVC.recipients = ["7247574089"]
        composeVC.body = ("Hello! How can I assist you?")
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send text messages.")
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {}
    
    
    @IBAction func makeCall(_ sender: Any) {
        
        let url:NSURL = URL(string: "TEL://7247574089")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
