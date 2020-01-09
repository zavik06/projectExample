//
//  AddressEditViewController.swift
//  influenzy
//
//  Created by Влад  on 27.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class AddressEditViewController: UIViewController {
    let helper = ViewHelper()
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomConst.constant = 1
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.borderColor = helper.blueBorder.cgColor
        cancelBtn.layer.cornerRadius = cancelBtn.frame.height/2
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = helper.blueBorder.cgColor
        hideKeyboardWhenTappedAround()
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOpacity = 0.25
        bottomView.layer.shadowOffset = .zero
        bottomView.layer.shadowRadius = 5
        bottomView.layer.masksToBounds = false
        bottomView.clipsToBounds = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @objc func keyboardWillShow(notification: NSNotification) {
            
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                if self.bottomConst.constant == 1 {
                    self.bottomConst.constant += keyboardHeight-83
                }
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                  self.view.layoutIfNeeded()
                }, completion: { finished in
                  
                })
                
            }
        }
    
    @IBAction func cancelAct(_ sender: Any) {
        let controller = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController(controller!, animated: true)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
            
            if self.bottomConst.constant != 0 {
                self.bottomConst.constant = 1
            }
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
              self.view.layoutIfNeeded()
            }, completion: { finished in
              
            })
        }
}
