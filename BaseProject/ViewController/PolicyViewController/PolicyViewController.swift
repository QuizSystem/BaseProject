//
//  PolicyViewController.swift
//  BaseProject
//
//  Created by  on 3/2/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import SVProgressHUD

class PolicyViewController: BaseViewController {

    @IBOutlet weak var policyWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCustomBackButton()
        self.navigationItem.title = "づトン樹"
        guard let url = URL(string: "http://www.apple.com/shop/help/shopping_experience") else {
            return
        }
        let request = URLRequest(url: url)
        self.policyWebView.loadRequest(request)
    }

}

extension PolicyViewController: UIWebViewDelegate {

    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show(withStatus: "Loading...")
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }

}
