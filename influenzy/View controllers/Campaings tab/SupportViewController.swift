//
//  SupportViewController.swift
//  influenzy
//
//  Created by Влад  on 09.01.2020.
//  Copyright © 2020 WHIZZBEES. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    @IBOutlet weak var supportBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
        supportBtn.layer.cornerRadius = supportBtn.frame.height/2
        // Do any additional setup after loading the view.
    }
    

}
