//
//  TabBarController.swift
//  BeFakeFinal
//
//  Created by Aryan Vaswani on 12/1/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController
{
    override func viewDidLoad() {
        super.viewDidLoad()
                    }
    
    override open var shouldAutorotate: Bool {
       return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return .portrait
    }
}
