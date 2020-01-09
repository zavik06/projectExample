//
//  AcceptedCampaingInfoViewController.swift
//  influenzy
//
//  Created by Влад  on 09.01.2020.
//  Copyright © 2020 WHIZZBEES. All rights reserved.
//

import UIKit
import GoogleMaps

class AcceptedCampaingInfoViewController: UIViewController {

    @IBOutlet weak var scrollConst: NSLayoutConstraint!
        var isInvited = true
        var isAccepted = false
        var isCompleted = false
        var isPaidSuppVisible = false
        var isAcceptedSuppVisible = false
        let helper = ViewHelper()
        @IBOutlet weak var viewForMap: UIView!
        @IBOutlet var interestsCollection: [UILabel]!

        @IBOutlet weak var scrollView: UIScrollView!

        @IBOutlet weak var acceptedSupport: UIView!
        @IBOutlet weak var acceptedTop: UIView!
        @IBOutlet var hashtagsCollection: [UILabel]!
        @IBOutlet weak var entertainmentLabel: UILabel!
        @IBOutlet weak var travelLabel: UILabel!
        @IBOutlet weak var beautyLabel: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            acceptedTop.layer.zPosition = 1
            acceptedSupport.layer.zPosition = 1
            acceptedSupport.roundCorners(.allCorners, radius: 5)
            self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1177)
            acceptedTop.layer.shadowColor = UIColor.black.cgColor
            acceptedTop.layer.shadowOpacity = 0.25
            acceptedTop.layer.shadowOffset = .zero
            acceptedTop.layer.shadowRadius = 5
            acceptedTop.layer.masksToBounds = false
            acceptedTop.clipsToBounds = false


            for interest in interestsCollection{
                interest.layer.cornerRadius = interest.frame.height/2
                interest.layer.masksToBounds = true
            }
            
            for hashtag in hashtagsCollection{
                hashtag.layer.cornerRadius = hashtag.frame.height/2
                hashtag.layer.masksToBounds = true
            }
            
            let camera = GMSCameraPosition.camera(withLatitude: 37.621262, longitude: -122.378945, zoom: 15)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: 37.621262, longitude: -122.378945)
            marker.icon = UIImage(named: "testMarker")
            let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: viewForMap.frame.width, height: viewForMap.frame.height), camera: camera)
            mapView.settings.setAllGesturesEnabled(false)
            viewForMap.addSubview(mapView)
            marker.map = mapView
        }
        
        @IBAction func moreAccepted(_ sender: Any) {
            if isAcceptedSuppVisible{
                acceptedSupport.isHidden = true
                isAcceptedSuppVisible = false
            } else {
                acceptedSupport.isHidden = false
                isAcceptedSuppVisible = true
            }
        }
        
    @IBAction func supportAct(_ sender: Any) {
        acceptedSupport.isHidden = true
        isAcceptedSuppVisible = false
        performSegue(withIdentifier: "toSupport", sender: nil)
    }
    
        
        
        override func viewWillDisappear(_ animated: Bool) {
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.navigationBar.isHidden = false
            self.navigationItem.setHidesBackButton(false, animated:true)
        }
        override func viewWillAppear(_ animated: Bool) {
            self.navigationItem.setHidesBackButton(false, animated:true)
        }
    }
