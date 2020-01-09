//
//  PasswordEditViewController.swift
//  influenzy
//
//  Created by Влад  on 27.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class PasswordEditViewController: UIViewController {
    let helper = ViewHelper()

    @IBOutlet var inputs: [UITextField]!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var newPassAgainField: UITextField!
    @IBOutlet weak var newPassField: UITextField!
    @IBOutlet weak var currPassField: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomConst.constant = 1
        hideKeyboardWhenTappedAround()
        makeFieldsFancy()
        
        saveBtn.layer.cornerRadius = saveBtn.frame.height/2
        
        cancelBtn.layer.borderColor = helper.blueBorder.cgColor
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.cornerRadius = cancelBtn.frame.height/2
        
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOpacity = 0.25
        bottomView.layer.shadowOffset = .zero
        bottomView.layer.shadowRadius = 5
        bottomView.layer.masksToBounds = false
        bottomView.clipsToBounds = false
        
        currPassField.attributedPlaceholder = NSAttributedString(string: "Current password", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
        newPassField.attributedPlaceholder = NSAttributedString(string: "New password", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
        newPassAgainField.attributedPlaceholder = NSAttributedString(string: "New password again", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func makeFieldsFancy(){
        for inputField in inputs{
            helper.customField(inputField)
        }
    }
    
    @IBAction func currPassEnd(_ sender: Any) {
        helper.editingEnd(currPassField)
    }
    @IBAction func currPassBegin(_ sender: Any) {
        helper.editingBegin(currPassField)
    }
    
    @IBAction func newPassEnd(_ sender: Any) {
        helper.editingEnd(newPassField)
    }
    
    @IBAction func newPassBegin(_ sender: Any) {
        helper.editingBegin(newPassField)
    }
    
    @IBAction func newPassAgainEnd(_ sender: Any) {
        helper.editingEnd(newPassAgainField)

    }
    @IBAction func newPassAgainBegin(_ sender: Any) {
        helper.editingBegin(newPassAgainField)
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        let controller = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController(controller!, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                if self.bottomConst.constant == 1 {
                    self.bottomConst.constant += keyboardHeight-83
                    print(keyboardHeight)
                }
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                  self.view.layoutIfNeeded()
                }, completion: { finished in
                  
                })
                
            }
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
