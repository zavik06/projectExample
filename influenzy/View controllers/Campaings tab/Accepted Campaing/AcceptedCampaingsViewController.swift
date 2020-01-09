//
//  AcceptedCampaingsViewController.swift
//  influenzy
//
//  Created by Влад  on 18.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class AcceptedCampaingsViewController: UIViewController {
    
    let helperClass = ViewHelper()
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdintifier = "cell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        [NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]

        setupCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(false, animated:true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           setupCollectionViewItemSize()
    }
       
    private func setupCollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           let nib = UINib(nibName: "InvitedCampaingsCollectionViewCell", bundle: nil)
           collectionView.register(nib, forCellWithReuseIdentifier: cellIdintifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat = 10
            
            
            
            let width = (collectionView.frame.width - 20)
            let height: CGFloat = 100
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    @IBAction func invitedAct(_ sender: Any) {
        let controller = self.navigationController?.viewControllers[0]
        self.navigationController?.popToViewController(controller!, animated: false)
    }
    @IBAction func completedAct(_ sender: Any) {
        performSegue(withIdentifier: "toCompleted", sender: nil)
    }
    

}

extension AcceptedCampaingsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdintifier, for: indexPath) as! InvitedCampaingsCollectionViewCell
        cell.imageView.image = UIImage(named: "acceptedCampaing")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCampaing", sender: nil)
    }
    
    func loadImageFromURL(urlStr: String) -> UIImage? {
        if let url = URL(string: urlStr){
            do{
                let data = try Data(contentsOf: url)
                return UIImage(data: data)
            }catch let err{
                print(err.localizedDescription)
            }
        }
        return UIImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
