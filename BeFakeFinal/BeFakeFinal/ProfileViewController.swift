//
//  FeedViewController.swift
//  BeFakeFinal
//
//  Created by Aryan Vaswani on 12/6/22.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var passwordfield: UITextField!
    @IBOutlet weak var usernamefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateusername(_ sender: Any) {
        let session = URLSession.shared
        let url = "http://127.0.0.1:1323/v1/updateuser"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var params :[String: Any]?
        params = ["username" : "group48", "new_username" : usernamefield.text, "new_password" : passwordfield.text]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                }
                if let error = error {
                    print ("\(error)")
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    @IBAction func updatepassword(_ sender: Any) {
        let session = URLSession.shared
        let url = "http://127.0.0.1:1323/v1/updateuser"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var params :[String: Any]?
        params = ["username" : "group48", "new_username" : usernamefield.text, "new_password" : passwordfield.text]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                }
                if let error = error {
                    print ("\(error)")
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
}
