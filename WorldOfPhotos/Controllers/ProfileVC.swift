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
    @IBOutlet weak var onBoardingScrnView: ProfileBoardingView!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - Title Label
    @IBOutlet weak var usernameLbl: UILabel!
    
    // MARK: - User Info Outlets
    @IBOutlet weak var tapImageForChngLbl: UILabel!
    @IBOutlet weak var profImage: CircleImageView!
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var userInfoStackView: UIStackView!
    
    var timer = Timer()
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileOnboardingView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(profileViewChanges(_:)), name: NSNotification.Name("signUpComplete"), object: nil)
        self.setTheProfileImage()
    }
    
    func setTheProfileImage() {
        self.profImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setImageOptions))
        profImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func setImageOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func profileViewChanges(_ : Notification) {
        UIView.animate(withDuration: 0.4) {
            self.onBoardingScrnView.alpha = 0
            self.loginBtn.alpha = 0
            self.createAcntBtn.alpha = 0
            self.logoutBtn.alpha = 1
            self.editProfileBtn.alpha = 1
            self.profImage.alpha = 1
            self.editProfileBtn.alpha = 1
            self.userInfoStackView.alpha = 1
            self.tapImageForChngLbl.alpha = 1
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.displayTheLbl), userInfo: nil, repeats: true)
        }
    }
    
    @objc func displayTheLbl() {
        UIView.animate(withDuration: 0.4) {
            self.tapImageForChngLbl.alpha = 0
        }
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

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let takenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profImage.image = takenImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
