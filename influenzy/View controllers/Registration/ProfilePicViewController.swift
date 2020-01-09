//
//  ProfilePicViewController.swift
//  influenzy
//
//  Created by Влад  on 14.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class ProfilePicViewController: UIViewController {
    
    @IBOutlet var roundedViews: [UIView]!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var avatarBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        for roundedView in roundedViews {
            roundedView.layer.cornerRadius = roundedView.frame.height/2
        }
        registerBtn.layer.cornerRadius = registerBtn.frame.height/2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func registerAct(_ sender: Any) {
        performSegue(withIdentifier: "registred", sender: nil)
    }
    
    @IBAction func avatarAct(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let actionSheet = UIAlertController(title:"Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler:{ action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerController.sourceType = .camera
            imagePickerController.cameraCaptureMode = .photo
            self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera isn't available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: UIAlertAction.Style.default, handler:{ action in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
