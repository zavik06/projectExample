//
//  PaymentMethodViewController.swift
//  influenzy
//
//  Created by Влад  on 27.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class PaymentMethodViewController: UIViewController {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var paymentMethodView: UIView!
    @IBOutlet weak var cvvField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var cardholderField: UITextField!
    @IBOutlet weak var cardholderLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardNumberField: UITextField!
    @IBOutlet weak var editView: UIView!
    let helper = ViewHelper()
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.customField(cardholderField)
        helper.customField(cardNumberField)
        helper.customField(monthField)
        helper.customField(yearField)
        helper.customField(cvvField)
        cardholderField.attributedPlaceholder = NSAttributedString(string: "Cardholder's name", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        cardNumberField.attributedPlaceholder = NSAttributedString(string: "Card number", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        yearField.attributedPlaceholder = NSAttributedString(string: "YYYY", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        monthField.attributedPlaceholder = NSAttributedString(string: "MM", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        cvvField.attributedPlaceholder = NSAttributedString(string: "CVV", attributes: [
            .foregroundColor: helper.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
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
        self.bottomConst.constant = 50

        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
        editBtn.layer.cornerRadius = editBtn.frame.height/2
        removeBtn.layer.cornerRadius = removeBtn.frame.height/2
        removeBtn.layer.borderColor = helper.blueBorder.cgColor
        removeBtn.layer.borderWidth = 2
        removeBtn.layer.cornerRadius = removeBtn.frame.height/2
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        hideKeyboardWhenTappedAround()
        monthField.setLeftPaddingPoints(0)
        yearField.setLeftPaddingPoints(0)
        cvvField.setLeftPaddingPoints(0)


    }
    
    @IBAction func cardNumEnd(_ sender: Any) {
        helper.editingEnd(cardNumberField)
    }
    
    @IBAction func cardNumBegin(_ sender: Any){
        helper.editingBegin(cardNumberField)
    }
    
    @IBAction func cardholderEnd(_ sender: Any) {
        helper.editingEnd(cardholderField)
    }
    
    @IBAction func cardholderBegin(_ sender: Any) {
        helper.editingBegin(cardholderField)
    }
    
    
    @IBAction func cancelAct(_ sender: Any) {
        paymentMethodView.isHidden = false
        bottomView.isHidden = true
        editView.isHidden = true
    }
    
    @IBAction func saveAct(_ sender: Any) {
        paymentMethodView.isHidden = false
        bottomView.isHidden = true
        editView.isHidden = true
    }
    
    @IBAction func editAct(_ sender: Any) {
        paymentMethodView.isHidden = true
        bottomView.isHidden = false
        editView.isHidden = false
    }
    
    
    
    @IBAction func historyAction(_ sender: Any) {
        performSegue(withIdentifier: "paymentHistory", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if self.bottomConst.constant != 50 {
            self.bottomConst.constant = 50
        }
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
          self.view.layoutIfNeeded()
        }, completion: { finished in
          
        })
    }
    @objc func keyboardWillChange(notification: NSNotification) {
        
        if self.bottomConst.constant != 50 {
            self.bottomConst.constant = 50
        }
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
          self.view.layoutIfNeeded()
        }, completion: { finished in
          
        })
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

}
