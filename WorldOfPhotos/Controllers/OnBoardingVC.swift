//
//  ViewController.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/7/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import paper_onboarding

class OnBoardingVC: UIViewController {

    @IBOutlet weak var onboardingView: OnBoardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
}

extension OnBoardingVC: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColor = UIColor.darkGray

        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("smartphoneImg", "Welcome to \'World Of Photos\'", "World Of photos capture your memories in the form of photos.", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont),("worldImg", "Travel the World", "Take photos of everything you see and like.", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont),("exploreImg", "Start Exploring", "World Of photos helps saving your photos.", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
}

extension OnBoardingVC: PaperOnboardingDelegate {
    func onboardingWillTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    
}
