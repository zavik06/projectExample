//
//  DefineInfluenceViewController.swift
//  influenzy
//
//  Created by Влад  on 11.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class DefineInfluenceViewController: UIViewController {
    @IBOutlet weak var globalInfluencerView: UIView!
    @IBOutlet weak var shadowGlobalView: UIView!
    @IBOutlet weak var blueGlobalView: UIView!
    @IBOutlet weak var globalButton: UIButton!
    
    @IBOutlet weak var localInfluencerView: UIView!
    @IBOutlet weak var shadowLocalView: UIView!
    @IBOutlet weak var blueLocalView: UIView!
    @IBOutlet weak var localButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var localInfImg: UIImageView!
    
    @IBOutlet weak var globalInfImg: UIImageView!
    
    var isLocalHighlighted = false
    var isGlobalHighlighted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        globalInfluencerView.layer.cornerRadius = 5
        localInfluencerView.layer.cornerRadius = 5
        blueGlobalView.layer.cornerRadius = 5
        blueLocalView.layer.cornerRadius = 5
        shadowGlobalView.layer.cornerRadius = 5
        shadowLocalView.layer.cornerRadius = 5
        shadowGlobalView.layer.cornerRadius = 5
        shadowLocalView.layer.cornerRadius = 5
        localInfImg.layer.cornerRadius = 5
        globalInfImg.layer.cornerRadius = 5

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "socials", sender: nil)
    }
    
    
    @IBAction func globalButtonAction(_ sender: Any) {
        self.higlightGlobal()
    }
    
    @IBAction func localButtonAction(_ sender: Any) {
        self.higlightLocal()
    }
    
    private func higlightGlobal(){
        if isGlobalHighlighted{
            hideGlobal()
            isGlobalHighlighted = false
        }else{
            hideLocal()
            shadowGlobalView.isHidden = true
            blueGlobalView.isHidden = false
            self.isGlobalHighlighted = true
            self.isLocalHighlighted = false
        }
    }

    private func higlightLocal(){
        if isLocalHighlighted{
            hideLocal()
            isLocalHighlighted = false
        } else {
            hideGlobal()
            shadowLocalView.isHidden = true
            blueLocalView.isHidden = false
            self.isLocalHighlighted = true
            self.isGlobalHighlighted = false
        }
    }
    
    private func hideLocal(){
        shadowLocalView.isHidden = false
        blueLocalView.isHidden = true
    }
    
    private func hideGlobal(){
        shadowGlobalView.isHidden = false
        blueGlobalView.isHidden = true
    }
    
}
