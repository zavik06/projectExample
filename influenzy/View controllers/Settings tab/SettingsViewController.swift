//
//  SettingsViewController.swift
//  influenzy
//
//  Created by Влад  on 21.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let helper = ViewHelper()
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    @IBOutlet var blocks: [UIView]!
    @IBOutlet var supportBtns: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
        for block in blocks {
            block.layer.cornerRadius = 6
            block.layer.masksToBounds = true
            block.layer.shadowColor = UIColor.black.cgColor
            block.layer.shadowOpacity = 0.25
            block.layer.shadowOffset = .zero
            block.layer.shadowRadius = 5
            block.layer.masksToBounds = false
            block.clipsToBounds = false
        }
        
        for btn in supportBtns{
            btn.titleEdgeInsets.left = 25
        }
        editBtn.layer.cornerRadius = editBtn.frame.height/2
        editBtn.layer.borderWidth = 2
        editBtn.layer.borderColor = helper.greyBorder.cgColor
        logOutBtn.layer.cornerRadius = logOutBtn.frame.height/2
        logOutBtn.layer.borderWidth = 2
        logOutBtn.layer.borderColor = helper.greyBorder.cgColor
        
    }

    @IBAction func logOutAct(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Are you sure want to log out?", preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:{ action in
            self.logOutHelper()
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func logOutHelper(){
        performSegue(withIdentifier: "logOutSegue", sender: nil)
    }
    
    @IBAction func editAct(_ sender: Any) {
        performSegue(withIdentifier: "edit", sender: nil)
    }
    
}
