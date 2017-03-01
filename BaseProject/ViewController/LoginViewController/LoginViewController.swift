//
//  LoginViewController.swift
//  BaseProject
//
//  Created by Nguyen Van Thieu B on 3/1/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LoginViewController: BaseViewController {
    
    let loginManager = FBSDKLoginManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    @IBAction func loginFacebookButtonClicked(_ sender: Any) {
        if (FBSDKAccessToken.current() != nil) {
            // TODO: do something when have Access Token of Facebook
            return
        }
        else {
            loginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self.parent) {[weak self] (result, error) in
                if error != nil || (result?.isCancelled)! {
                    self?.showAlert(title: "Error", password: "Failure")
                } else {
                    self?.showAlert(title: "Ok", password: "Success")
                }
            }
        }
    }
    
    func showAlert(title: String, password: String) {
        let alert = UIAlertController(title: title, message: password, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
