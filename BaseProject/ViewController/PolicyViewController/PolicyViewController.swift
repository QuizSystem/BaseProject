//
//  PolicyViewController.swift
//  BaseProject
//
//  Created by  on 3/2/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class PolicyViewController: BaseViewController {

    @IBOutlet weak var policyWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "http://www.apple.com/shop/help/shopping_experience") else {
            return
        }
        let request = URLRequest(url: url)
        self.policyWebView.loadRequest(request)
    }
    
    // MARK: - IBActions
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
