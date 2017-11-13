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
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var loginSignUpBtn: UIButton!
    
    // MARK: - Login Outlets
    @IBOutlet weak var loginEmailTxt: UITextField!
    @IBOutlet weak var loginPasswordTxt: UITextField!
    
    
    // MARK: - SignUp Outlets
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var middleNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneNumTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    
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
                self.signUpBtn.alpha = 1
                self.loginStackView.alpha = 1
                self.loginSignUpBtn.setTitle("Login", for: .normal)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.signUpStackView.alpha = 1
                self.signUpBtn.alpha = 0
                self.loginStackView.alpha = 0
                self.loginSignUpBtn.setTitle("SignUp", for: .normal)
            })
        }
    }
    
    func handleKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.loginStackView.alpha = 0
            self.signUpStackView.alpha = 1
            self.signUpBtn.alpha = 0
            self.loginSignUpTitleLbl.text = "SignUp"
            self.loginSignUpBtn.setTitle("SignUp", for: .normal)
        }
    }
    
    @IBAction func loginSignUpBtnPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "SignUp" {
            guard let fName = firstNameTxt.text, let mName = middleNameTxt.text, let lName = lastNameTxt.text, let email = emailTxt.text, let phone = phoneNumTxt.text, let pass = passwordTxt.text, let confPass = confirmPasswordTxt.text, firstNameTxt.text != "", lastNameTxt.text != "", emailTxt.text != "", phoneNumTxt.text != "", passwordTxt.text != "", confirmPasswordTxt.text != nil, passwordTxt.text == confirmPasswordTxt.text else {
                self.userInfoErrorAlert()
                return
            }
            print("\(fName)+\(mName)+\(lName)+\(email)+\(phone)+\(pass)+\(confPass)")
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name("signUpComplete"), object: nil)
        } else {
            print("Print signup")
        }
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
