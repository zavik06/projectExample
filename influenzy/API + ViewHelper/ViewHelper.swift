//
//  ViewHelper.swift
//  Hotel Roaming
//
//  Created by Влад  on 29.11.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import Foundation
import UIKit

class ViewHelper {
    let placeholderGrey = UIColor(red: 118.0/255.0, green: 118.0/255.0, blue: 118.0/255.0, alpha: 1.0/1.0)
    let redBorder = UIColor(red: 230.0/255.0, green: 0.0/255.0, blue: 35.0/255.0, alpha: 1.0/1.0)
    let blueBorder = UIColor(red: 13.0/255.0, green: 113.0/255.0, blue: 227.0/255.0, alpha: 1.0/1.0)
    let greyBorder = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0/1.0)
    let greyPlaceHolder = UIColor(red: 161.0/255.0, green: 161.0/255.0, blue: 161.0/255.0, alpha: 1.0/1.0)
    
    public func wrongDataOnLogin(_ outletLogin:UITextField,_ outletPass:UITextField){
        let alert = UIAlertController(title: "Wrong data", message: "Wrong email or password.", preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        alert.present(alert, animated: true, completion: nil)
        outletLogin.layer.borderColor = UIColor.red.cgColor
        outletPass.layer.borderColor = UIColor.red.cgColor
    }
    
    
    
    public func customField(_ outlet:UITextField){
        outlet.layer.borderWidth = 1
        outlet.layer.cornerRadius = outlet.frame.size.height/2
        outlet.textColor = UIColor.black
        outlet.layer.borderColor = greyBorder.cgColor
        outlet.layer.masksToBounds = true
        outlet.setLeftPaddingPoints(20)
    }
    //comment for commit
    
    public func priceField(_ outlet:UITextField){
        outlet.layer.borderWidth = 1
        outlet.layer.cornerRadius = 5
        outlet.textColor = UIColor.black
        outlet.borderStyle = UITextField.BorderStyle.roundedRect
        outlet.layer.borderColor = greyBorder.cgColor
        outlet.layer.masksToBounds = true
        outlet.setLeftPaddingPoints(20)
    }
    
    public func searchField(_ outlet:UITextField,_ placeholderText:String){
        //Basic texfield Setup
        outlet.borderStyle = .none
        outlet.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
        
        //To apply corner radius
        outlet.layer.cornerRadius = outlet.frame.size.height / 2
        
        //To apply border
        outlet.layer.borderWidth = 0.25
        outlet.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        outlet.layer.shadowOpacity = 1
        outlet.layer.shadowRadius = 3.0
        outlet.layer.shadowOffset = CGSize.zero // Use any CGSize
        outlet.layer.shadowColor = UIColor.gray.cgColor
        
        //To apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: outlet.frame.height))
        outlet.leftView = paddingView
        outlet.leftViewMode = UITextField.ViewMode.always

        outlet.setLeftPaddingPoints(20)
        outlet.setRightPaddingPoints(20)
        outlet.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    
    public func searchTab(_ outlet:UISearchBar){
        //Basic texfield Setup
        outlet.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
        
        //To apply corner radius
        outlet.layer.cornerRadius = outlet.frame.size.height / 2
        
        //To apply border
        outlet.layer.borderWidth = 0.25
        outlet.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        outlet.layer.shadowOpacity = 1
        outlet.layer.shadowRadius = 3.0
        outlet.layer.shadowOffset = CGSize.zero // Use any CGSize
        outlet.layer.shadowColor = UIColor.gray.cgColor
        
        //To apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: outlet.frame.height))
    }
    
    public func activeButton(_ button:UIButton){
        
    }
    
    public func inactiveButton(_ button:UIButton){
        
    }
    
    public func blackButton(_ outlet:UIButton,_ radius:CGFloat){
        
    }
    
    public func yellowButton(_ outlet:UIButton,_ radius:CGFloat){
       
    }
    
    public func editingBegin(_ outlet:UITextField){
        outlet.layer.borderColor = blueBorder.cgColor
        outlet.textColor = UIColor.black
    }
    
    public func editingEnd(_ outlet:UITextField){
        if isInputNotEmpty(outlet){
            outlet.layer.borderColor = blueBorder.cgColor
        } else{
            outlet.layer.borderColor = redBorder.cgColor
        }
    }
    
    public func isInputNotEmpty(_ outlet:UITextField) -> Bool{
        if outlet.text != ""{
            return true
        }else {
            return false
        }
    }
    
    public func loginButton(_ outlet:UIButton,_ radius:CGFloat){
        outlet.backgroundColor = UIColor.black
        outlet.layer.cornerRadius = radius
        outlet.titleLabel?.textColor = UIColor.white
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


