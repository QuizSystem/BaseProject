//
//  BaseNavigationController.swift
//  BaseProject
//
//  Created by Nguyen Van Thieu B on 3/1/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarHidden(false, with: .none)
        self.navigationBar.barTintColor = UIColor(red: 254.0 / 255.0, green: 211.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        self.navigationBar.tintColor = .black
        self.navigationBar.isTranslucent = false
    }

}
