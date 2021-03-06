//
//  ConnectAccountsViewController.swift
//  influenzy
//
//  Created by Влад  on 14.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class ConnectAccountsViewController: UIViewController {
    @IBOutlet weak var facebookField: UITextField!
    @IBOutlet weak var instaField: UITextField!
    @IBOutlet weak var twitterField: UITextField!
    @IBOutlet weak var pinterestField: UITextField!
    @IBOutlet weak var youtubeField: UITextField!
    @IBOutlet weak var twitchField: UITextField!
    @IBOutlet weak var blogField: UITextField!
    
    @IBOutlet var fields: [UITextField]!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var twitchLabel: UILabel!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var pinterestLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var instaLabel: UILabel!
    @IBOutlet weak var fbLabel: UILabel!
    
    
    let helperClass = ViewHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeFieldsFancy()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 750)
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        facebookField.attributedPlaceholder = NSAttributedString(string: "Facebook", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        instaField.attributedPlaceholder = NSAttributedString(string: "Instagram", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
        pinterestField.attributedPlaceholder = NSAttributedString(string: "Pinterest", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        
        youtubeField.attributedPlaceholder = NSAttributedString(string: "Youtube", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        twitchField.attributedPlaceholder = NSAttributedString(string: "Twitch", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        blogField.attributedPlaceholder = NSAttributedString(string: "Blog", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        twitterField.attributedPlaceholder = NSAttributedString(string: "Twitter", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }

    
    
    
    @IBAction func fbBegin(_ sender: Any) {
        helperClass.editingBegin(facebookField)
        fbLabel.textColor = helperClass.blueBorder
    }
    @IBAction func fbEnd(_ sender: Any) {
        helperClass.editingEnd(facebookField)
//        fbLabel.textColor = helperClass.greyBorder
    }
    @IBAction func instaBegin(_ sender: Any) {
        helperClass.editingBegin(instaField)
        instaLabel.textColor = helperClass.blueBorder
    }
    @IBAction func instaEnd(_ sender: Any) {
        helperClass.editingEnd(instaField)
//        instaLabel.textColor = helperClass.greyBorder
    }
    @IBAction func twitterBegin(_ sender: Any) {
        helperClass.editingBegin(twitterField)
        twitterLabel.textColor = helperClass.blueBorder
    }
    @IBAction func twitterEnd(_ sender: Any) {
        helperClass.editingEnd(twitterField)
//        twitterLabel.textColor = helperClass.greyBorder
    }
    @IBAction func pinBegin(_ sender: Any) {
        helperClass.editingBegin(pinterestField)
        pinterestLabel.textColor = helperClass.blueBorder
    }
    @IBAction func pinEnd(_ sender: Any) {
        helperClass.editingEnd(pinterestField)
//        pinterestLabel.textColor = helperClass.greyBorder
    }
    @IBAction func youtubeBegin(_ sender: Any) {
        helperClass.editingBegin(youtubeField)
        youtubeLabel.textColor = helperClass.blueBorder
    }
    @IBAction func youtubeEnd(_ sender: Any) {
        helperClass.editingEnd(youtubeField)
//        youtubeLabel.textColor = helperClass.greyBorder
    }
    @IBAction func twitchBegin(_ sender: Any) {
        helperClass.editingBegin(twitchField)
        twitchLabel.textColor = helperClass.blueBorder
    }
    @IBAction func twitchEnd(_ sender: Any) {
        helperClass.editingEnd(twitchField)
//        twitchLabel.textColor = helperClass.greyBorder
    }
    @IBAction func blogBegin(_ sender: Any) {
        helperClass.editingBegin(blogField)
        blogLabel.textColor = helperClass.blueBorder
    }
    @IBAction func blogEnd(_ sender: Any) {
        helperClass.editingEnd(blogField)
//        blogLabel.textColor = helperClass.greyBorder
    }
    @IBAction func nextBtnAct(_ sender: Any) {
        performSegue(withIdentifier: "profilePic", sender: nil)
    }
    
    
    private func makeFieldsFancy(){
        for inputField in fields{
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
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                  self.view.layoutIfNeeded()
                }, completion: { finished in
                  
                })
                
            }
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
