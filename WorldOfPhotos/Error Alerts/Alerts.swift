//
//  Alerts.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/10/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit


extension UIViewController {
    func userInfoErrorAlert() {
        let alert = UIAlertController.init(title: "Information Provided is Incorrect", message: "May be passwords does not match", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
