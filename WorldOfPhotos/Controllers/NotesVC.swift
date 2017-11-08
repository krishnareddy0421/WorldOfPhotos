//
//  NotesVC.swift
//  WorldOfPhotos
//
//  Created by vamsi krishna reddy kamjula on 11/7/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var notesTxtView: UITextView!
    @IBOutlet weak var notesLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func editAndSaveBtnPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "editImg") {
            UIView.animate(withDuration: 0.4, animations: {
                sender.setImage(UIImage(named: "saveImg"), for: .normal)
                self.notesLbl.alpha = 0
                self.notesTxtView.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                sender.setImage(UIImage(named: "editImg"), for: .normal)
                self.notesTxtView.alpha = 0
                self.notesLbl.alpha = 1
                self.notesLbl.text = self.notesTxtView.text
            })
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "SWRevealVC")
        self.present(homeVC, animated: true, completion: nil)
    }
}

extension NotesVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.notesTxtView.text = nil
    }
}
