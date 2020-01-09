//
//  RegitsrationMainInfoViewController.swift
//  influenzy
//
//  Created by Влад  on 10.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class RegitsrationMainInfoViewController: UIViewController {
    let helperClass = ViewHelper()
    
    @IBOutlet weak var pass2Label: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet var inputs: [UITextField]!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordAgainField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeFieldsFancy()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 740)
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        hideKeyboardWhenTappedAround()
        nameField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        surnameField.attributedPlaceholder = NSAttributedString(string: "Surname", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        phoneField.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        passwordAgainField.attributedPlaceholder = NSAttributedString(string: "Password again", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        performSegue(withIdentifier: "verification", sender: nil)
    }

    private func makeFieldsFancy(){
        for inputField in inputs{
            helperClass.customField(inputField)
        }
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
//            if self.bottomConst.constant == 0 {
//                self.bottomConst.constant += keyboardHeight
//                print(self.bottomConst.constant)
//            }
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
              self.view.layoutIfNeeded()
            }, completion: { finished in
              
            })
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func nameBegin(_ sender: Any) {
        helperClass.editingBegin(nameField)
        nameLabel.textColor = helperClass.blueBorder
    }
    
    @IBAction func nameEnd(_ sender: Any) {
        helperClass.editingEnd(nameField)
        nameLabel.textColor = helperClass.greyBorder
    }
    
    @IBAction func surnameBegin(_ sender: Any) {
        helperClass.editingBegin(surnameField)
        surnameLabel.textColor = helperClass.blueBorder
    }
    @IBAction func surnameEnd(_ sender: Any) {
        helperClass.editingEnd(surnameField)
        surnameLabel.textColor = helperClass.greyBorder

    }
    
    @IBAction func emailBegin(_ sender: Any) {
        helperClass.editingBegin(emailField)
        emailLabel.textColor = helperClass.blueBorder
        
    }
    
    @IBAction func emailEnd(_ sender: Any) {
        helperClass.editingEnd(emailField)
        emailLabel.textColor = helperClass.greyBorder

    }
    
    @IBAction func phoneBegin(_ sender: Any) {
        helperClass.editingBegin(phoneField)
        phoneLabel.textColor = helperClass.blueBorder

    }
    
    @IBAction func phoneEnd(_ sender: Any) {
        helperClass.editingEnd(phoneField)
        phoneLabel.textColor = helperClass.greyBorder

    }
    
    @IBAction func passBegin(_ sender: Any) {
        helperClass.editingBegin(passwordField)
        passLabel.textColor = helperClass.blueBorder

    }
    
    @IBAction func passEnd(_ sender: Any) {
        helperClass.editingEnd(passwordField)
        passLabel.textColor = helperClass.greyBorder

    }
    
    @IBAction func pass2Begin(_ sender: Any) {
        helperClass.editingBegin(passwordAgainField)
        pass2Label.textColor = helperClass.blueBorder
    }
    
    @IBAction func pass2End(_ sender: Any) {
        helperClass.editingEnd(passwordAgainField)
        pass2Label.textColor = helperClass.greyBorder
    }
    
    
    
    
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
//        if self.bottomConst.constant != 0 {
//            self.bottomConst.constant = 0
//        }
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
          self.view.layoutIfNeeded()
        }, completion: { finished in
          
        })
    }
}
