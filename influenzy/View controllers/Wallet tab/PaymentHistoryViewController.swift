//
//  PaymentHistoryViewController.swift
//  influenzy
//
//  Created by Влад  on 27.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class PaymentHistoryViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func paymentMethodAction(_ sender: Any) {
        let controller = self.navigationController?.viewControllers[0]
        self.navigationController?.popToViewController(controller!, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
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
            let height: CGFloat = 90
            
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
           let nib = UINib(nibName: "PaymentHistoryCollectionViewCell", bundle: nil)
           collectionView.register(nib, forCellWithReuseIdentifier: cellIdintifier)
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

extension PaymentHistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdintifier, for: indexPath) as! PaymentHistoryCollectionViewCell
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
