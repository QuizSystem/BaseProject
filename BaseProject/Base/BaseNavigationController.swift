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
        UIApplication.shared.setStatusBarHidden(true, with: .none)
        UIApplication.shared.setStatusBarHidden(false, with: .none)
        self.navigationBar.barTintColor = UIColor(red: 137/255.0, green: 171/255.0, blue: 227/255.0, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
