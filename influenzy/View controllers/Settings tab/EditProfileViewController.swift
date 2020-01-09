//
//  EditProfileViewController.swift
//  influenzy
//
//  Created by Влад  on 27.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
        
        for btn in buttons{
            btn.titleEdgeInsets.left = 20
        }
        
    }
    @IBAction func closeAccountAct(_ sender: Any) {
        let alert = UIAlertController(title: "Close account?", message: "Are you sure you want to close your Influenzy account?", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func passwordAct(_ sender: Any) {
        performSegue(withIdentifier: "password", sender: nil)
    }
    
    @IBAction func addressAct(_ sender: Any) {
        performSegue(withIdentifier: "address", sender: nil)
    }
    @IBAction func profilePictureAct(_ sender: Any) {
        performSegue(withIdentifier: "picture", sender: nil)
    }
    
    @IBAction func aboutMeAct(_ sender: Any) {
        performSegue(withIdentifier: "aboutMe", sender: nil)
    }
    @IBAction func socialNetworks(_ sender: Any) {
        performSegue(withIdentifier: "socials", sender: nil)
    }
}
