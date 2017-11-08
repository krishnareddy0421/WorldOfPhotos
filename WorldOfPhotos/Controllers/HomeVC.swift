//
//  HomeVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/7/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideMenus()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func gridViewGlobeViewBtnPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "worldViewImg") {
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 0
                self.mapView.alpha = 1
                sender.setImage(UIImage(named: "gridViewImg"), for: .normal)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
                self.mapView.alpha = 0
                sender.setImage(UIImage(named: "worldViewImg"), for: .normal)
            })
        }
    }
    
    @IBAction func cameraBtnPressed(_ sender: UIButton) {
        
    }
    
    func setUpSideMenus() {
        if revealViewController() != nil {
            profileBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
            menuBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath)
        
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfColumns : CGFloat = 3
        
        let spaceBetweenCells : CGFloat = 5
        let padding : CGFloat = 10
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
}
