//
//  ProfileVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/7/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import paper_onboarding

class ProfileVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var profileOnboardingView: ProfileBoardingView!
    @IBOutlet weak var createAcntBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        profileOnboardingView.dataSource = self
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func createAcntBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! Login_SignUpVC
        if segue.identifier == "toLogin" {
            VC.titleString = "Login"
        } else {
            VC.titleString = "SignUp"
        }
    }
}

extension ProfileVC: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 1
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        UIView.animate(withDuration: 0.4, animations: {
            self.loginBtn.alpha = 1
            self.createAcntBtn.alpha = 1
        })
        
        let backgroundColor = UIColor.darkGray
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("profileImg", "\'World of Photos\'", "Save your photo memories. Login or Create a new account.", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
}
