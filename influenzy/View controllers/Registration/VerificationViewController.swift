//
//  VerificationViewController.swift
//  influenzy
//
//  Created by Влад  on 10.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {

    let helperClass = ViewHelper()
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        helperClass.customField(codeField)
        codeField.attributedPlaceholder = NSAttributedString(string: "Code", attributes: [
            .foregroundColor: helperClass.greyPlaceHolder,
            .font:
                UIFont.systemFont(ofSize: 13.0)
        ])
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        performSegue(withIdentifier: "interests", sender: nil)
    }
    
    @IBAction func codeBegin(_ sender: Any) {
        helperClass.editingBegin(codeField)
        codeLabel.textColor = helperClass.blueBorder
    }
    @IBAction func codeEnd(_ sender: Any) {
        helperClass.editingEnd(codeField)
        codeLabel.textColor = helperClass.greyBorder
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
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
