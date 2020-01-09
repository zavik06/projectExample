//
//  ProfileViewController.swift
//  influenzy
//
//  Created by Влад  on 21.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var aboutMeText: UITextView!
    @IBOutlet var interests: [CustomLabel]!
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet var interestsPointsCollection: [UILabel]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 680)
        aboutMeText.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        avatarView.layer.cornerRadius = avatarView.frame.height/2
        for interest in interests {
            interest.layer.cornerRadius = interest.frame.height/2
            interest.layer.masksToBounds = true
        }
        for interestPoints in interestsPointsCollection {
            interestPoints.layer.cornerRadius = interestPoints.frame.height/2
            interestPoints.layer.masksToBounds = true
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editAboutMeBtnAct(_ sender: Any) {
        performSegue(withIdentifier: "aboutMe", sender: nil)
    }
    @IBAction func editNetworks(_ sender: Any) {
        performSegue(withIdentifier: "editNetworks", sender: nil)
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    public override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func profilePicAction(_ sender: Any) {
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
}

class CustomLabel: UILabel{
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets.init(top: 0, left: 40, bottom: 0, right: 0)))
    }
}
