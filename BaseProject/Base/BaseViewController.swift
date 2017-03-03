//
//  BaseViewController.swift
//  BaseProject
//
//  Created by Nguyen Van Thieu B on 3/1/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 254.0 / 255.0, green: 211.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    func addCustomBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "icon_back.png"),
            style: .plain, target: self, action: #selector(closeButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }

    func closeButtonTapped() {
        SVProgressHUD.dismiss()
        _ = self.navigationController?.popViewController(animated: true)
    }

}
