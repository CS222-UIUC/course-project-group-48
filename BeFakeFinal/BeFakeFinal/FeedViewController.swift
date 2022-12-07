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

class FeedViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    let captureSession = AVCaptureSession()
    var captureDevice:AVCaptureDevice!
    var previewLayer:CALayer!
    @IBOutlet weak var uploadphotobutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadphoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            image.image = img
            let session = URLSession.shared
            let url = "http://127.0.0.1:1323/v1/addimage"
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            var params :[String: Any]?
            let data = img?.pngData()
            params = ["username" : "group48", "photo" : data?.base64EncodedString(options: .endLineWithLineFeed)]
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
                let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                    if let response = response {
                        let nsHTTPResponse = response as! HTTPURLResponse
                        let statusCode = nsHTTPResponse.statusCode
                        print ("status code = \(statusCode)")
                        if (statusCode == 200) {
                            
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
            self.dismiss(animated: true, completion: nil)
        }
    
}
