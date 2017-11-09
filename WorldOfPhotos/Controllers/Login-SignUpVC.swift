//
//  Login-SignUpVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/9/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class Login_SignUpVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginSignUpTitleLbl: UILabel!
    @IBOutlet weak var signUpStackView: UIStackView!
    @IBOutlet weak var loginSignUpBtn: UIButton!
    
    var titleString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.loginSignUpTitleLbl.text = titleString!
        
        self.handleLoginSignUpForms()
        self.handleKeyboardOnTap()
    }

    func handleLoginSignUpForms() {
        if loginSignUpTitleLbl.text == "Login" {
            UIView.animate(withDuration: 0.4, animations: {
                self.signUpStackView.alpha = 0
                self.loginSignUpBtn.setTitle("Login", for: .normal)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.signUpStackView.alpha = 1
                self.loginSignUpBtn.setTitle("SignUp", for: .normal)
            })
        }
    }
    
    func handleKeyboardOnTap() {
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
