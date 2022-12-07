//
//  Groups.swift
//  BeFakeFinal
//
//  Created by Aryan Vaswani on 12/1/22.
//

import Foundation
import UIKit
import SwiftUI

class GroupViewController: UIViewController {
    
    @IBOutlet weak var groupname: UILabel!
    @IBOutlet weak var joinexitbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func joinexitpressed(_ sender: Any) {
        if joinexitbutton.titleLabel?.text == "Join Group" {
            let alert = UIAlertController(title: "Group Name", message: "Please enter the group name you would like to join.", preferredStyle: .alert)

            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.text = ""
            }
            

            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                let session = URLSession.shared
                            let url = "http://127.0.0.1:1323/v1/joingroup"
                            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
                            request.httpMethod = "POST"
                            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                            var params :[String: Any]?
                params = ["groupname" : textField!.text!, "username" : "group48"]
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
                self.groupname.text = textField!.text
                self.groupname.textColor = UIColor.black
                print("Text field: \(textField!.text ?? "CAPGROUP")")
            }))
            

            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
            joinexitbutton.setTitle("Exit Group", for: .normal)
        } else {
            let session = URLSession.shared
                        let url = "http://127.0.0.1:1323/v1/leavegroup"
                        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
                        request.httpMethod = "POST"
                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        var params :[String: Any]?
            params = ["username" : "group48", "groupname" : self.groupname.text]
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
            self.groupname.text = "No Group Found"
            self.groupname.textColor = UIColor.systemRed
            joinexitbutton.setTitle("Join Group", for: .normal)
        }
    }
}

