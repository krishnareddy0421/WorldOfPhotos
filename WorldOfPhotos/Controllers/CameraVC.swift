//
//  CameraVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/8/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class CameraVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var imgSavedLbl: UILabel!
    
    var savedImage: UIImage?
    var timer = Timer()
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isBeingPresented || isMovingToParentViewController {
            self.accessToCamera()
        }
    }
    
    func accessToCamera() {
        let alert = UIAlertController(title: "\'World Of Photos\' want to access your camera", message: "We need camera to capture your memories.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func retakeBtnPressed(_ sender: UIButton) {
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        StoreData.instance.images.append(imageView.image!)
        UIView.animate(withDuration: 0.4) {
            self.imgSavedLbl.alpha = 1
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.saveTheImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func saveTheImage() {
        UIView.animate(withDuration: 0.4) {
            self.saveBtn.alpha = 0
            self.imgSavedLbl.alpha = 0
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CameraVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let takenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = takenImage
            self.saveBtn.alpha = 1
            self.savedImage = takenImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
