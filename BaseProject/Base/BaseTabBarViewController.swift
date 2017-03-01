//
//  BaseTabBarViewController.swift
//  BaseProject
//
//  Created by Nguyen Van Thieu B on 3/1/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor(red: 137/255.0, green: 171/255.0, blue: 227/255.0, alpha: 1.0)
        self.tabBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
