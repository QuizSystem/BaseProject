//
//  RegisterViewController.swift
//  BaseProject
//
//  Created by  on 3/2/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import ActiveLabel

class RegisterViewController: BaseViewController {

    @IBOutlet weak var policyLabel: ActiveLabel!
    let linkKeyword = "Terms of Use and Privacy Policy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customLinkType = ActiveType.custom(pattern: "\\s\(linkKeyword)\\b")
        self.policyLabel?.enabledTypes.append(customLinkType)
        self.policyLabel?.customize({
            $0.customColor[customLinkType] = .blue
            $0.customSelectedColor[customLinkType] = .purple
            $0.handleCustomTap(for: customLinkType) { _ in
                self.redirectToPolicy()
            }
        })
    }
    
    func redirectToPolicy() {
        let policyViewController = PolicyViewController()
        self.present(policyViewController, animated: true, completion: nil)
    }

    // MARK: - IBActions

    @IBAction func registerWithFacebookButtonTapped(_ sender: Any) {
    }
    
    @IBAction func registerWithEmailButtonTapped(_ sender: Any) {
    }
    
    @IBAction func redirectToLoginButtonTapped(_ sender: Any) {
    }
    
}
