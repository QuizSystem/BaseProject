//
//  RegisterViewController.swift
//  BaseProject
//
//  Created by  on 3/2/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import ActiveLabel
import FBSDKLoginKit
import SVProgressHUD

class RegisterViewController: BaseViewController {

    @IBOutlet weak var policyLabel: ActiveLabel!
    let linkKeyword = "momdoきや考根"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let customLinkType = ActiveType.custom(pattern: linkKeyword)
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
        self.navigationController?.pushViewController(policyViewController, animated: true)
    }

    // MARK: - IBActions

    @IBAction func registerWithFacebookButtonTapped(_ sender: Any) {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logOut()
        facebookLogin.logIn(withReadPermissions: ["public_profile", "email"],
            from: self) { [weak self] (result, error) in
            if let error = error {
                SVProgressHUD.dismiss()
                self?.show(message: error.localizedDescription, title: nil, completion: nil)
                return
            }
            guard let result = result else {
                SVProgressHUD.dismiss()
                return
            }
            if (result.isCancelled) {
                SVProgressHUD.dismiss()
                return
            }
            let params = ["fields": "id, email, name, picture.type(large)"]
            FBSDKGraphRequest(graphPath: "me", parameters: params).start {
                (connection, result, error) in
                if let error = error {
                    self?.show(message: error.localizedDescription, title: nil,
                        completion: nil)
                    return
                }
                guard let result = result as? [String: Any] else {
                    return
                }
                guard
                    let id = result["id"] as? String,
                    let email = result["email"] as? String,
                    let name = result["name"] as? String,
                    let picture = result["picture"] as? NSDictionary,
                    let data = picture["data"] as? NSDictionary,
                    let url = data["url"] as? String
                    else {
                    return
                }
                print("id: \(id), email: \(email), name: \(name), avatarURL: \(url)")
                SVProgressHUD.dismiss()
            }
        }
    }
    
    @IBAction func registerWithEmailButtonTapped(_ sender: Any) {
        let emailRegisterViewController = EmailRegisterViewController()
        self.navigationController?.pushViewController(emailRegisterViewController, animated: true)
    }
    
    @IBAction func redirectToLoginButtonTapped(_ sender: Any) {
    }
    
}
