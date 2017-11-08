//
//  ProfileVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/7/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
