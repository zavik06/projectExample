//
//  NotificationsViewController.swift
//  influenzy
//
//  Created by Влад  on 21.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdintifier = "cell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let helperClass = ViewHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 17)!]
        setupCollectionView()
        
    }
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           setupCollectionViewItemSize()
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat = 10
            
            
            
            let width = (collectionView.frame.width - 20)
            let height: CGFloat = 87
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    private func setupCollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           let nib = UINib(nibName: "NotificationCollectionViewCell", bundle: nil)
           collectionView.register(nib, forCellWithReuseIdentifier: cellIdintifier)
    }

    

}

extension NotificationsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdintifier, for: indexPath) as! NotificationCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "toHandyProfile", sender: nil)
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
