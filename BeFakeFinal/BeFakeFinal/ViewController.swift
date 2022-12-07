//
//  ViewController.swift
//  BeFakeFinal
//
//  Created by Aryan Vaswani on 12/1/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func SignIn(_ sender: Any) {
        let session = URLSession.shared
        let url = "http://127.0.0.1:1323/v1/authuser"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var params :[String: Any]?
        params = ["username" : username.text!, "password" : password.text!]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                    if (statusCode == 200) {
                        DispatchQueue.main.async {
                            self.showTabBar()

                        }
                    }
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
    
    func showTabBar() {
        if (username.text != "") {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
            
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpPage")
                
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

