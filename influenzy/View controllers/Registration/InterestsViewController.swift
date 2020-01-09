//
//  InterestsViewController.swift
//  influenzy
//
//  Created by Влад  on 10.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

struct Interest {
  let image: String
  let label: String
  var isSelected: Bool
}


class InterestsViewController: UIViewController {
    
    
    var interests: [Interest] = []
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var cellIdintifier = "cell"
    var interestStyles: [Bool]?
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        let interest1 = Interest(image: "music", label: "Music", isSelected: false)
        let interest2 = Interest(image: "fitness", label: "Fitness & Yoga", isSelected: false)
        let interest3 = Interest(image: "business", label:"Business & Career", isSelected: false)
        let interest4 = Interest(image: "books", label: "Books and Literature", isSelected: false)
        let interest5 = Interest(image: "travel", label: "Travel & Tourism", isSelected: false)
        let interest6 = Interest(image: "children", label: "Children & Family", isSelected: false)
        let interest7 = Interest(image: "restaurants", label: "Restaurants & Food", isSelected: false)
        let interest8 = Interest(image: "healthy", label: "Healthy lifestyle", isSelected: false)
        let interest9 = Interest(image: "beauty", label: "Beauty & Fashion", isSelected: false)
        let interest10 = Interest(image: "movies", label: "Movies & TV", isSelected: false)
        let interest11 = Interest(image: "luxury", label: "Luxury Goods", isSelected: false)
        let interest12 = Interest(image: "entertainment", label: "Entertainment", isSelected: false)
        let interest13 = Interest(image: "sports", label: "Sports", isSelected: false)
        let interest14 = Interest(image: "technology", label: "Technology", isSelected: false)
        let interest15 = Interest(image: "gaming", label: "Gaming", isSelected: false)
        let interest16 = Interest(image: "finance", label: "Finance", isSelected: false)
        let interest17 = Interest(image: "art", label: "Art & Design", isSelected: false)
        let interest18 = Interest(image: "dancing", label: "Dancing", isSelected: false)
        let interest19 = Interest(image: "gardening", label: "Gardening", isSelected: false)
        let interest20 = Interest(image: "community", label: "Community", isSelected: false)
        let interest21 = Interest(image: "animal", label: "Animal care", isSelected: false)
        let interest22 = Interest(image: "mindfulness", label: "Mindfulness", isSelected: false)
        let interest23 = Interest(image: "spirituality", label: "Spirituality", isSelected: false)
        let interest24 = Interest(image: "household", label: "House hold", isSelected: false)

        interests.append(interest1)
        interests.append(interest2)
        interests.append(interest3)
        interests.append(interest4)
        interests.append(interest5)
        interests.append(interest6)
        interests.append(interest7)
        interests.append(interest8)
        interests.append(interest9)
        interests.append(interest10)
        interests.append(interest11)
        interests.append(interest12)
        interests.append(interest13)
        interests.append(interest14)
        interests.append(interest15)
        interests.append(interest16)
        interests.append(interest17)
        interests.append(interest18)
        interests.append(interest19)
        interests.append(interest20)
        interests.append(interest21)
        interests.append(interest22)
        interests.append(interest23)
        interests.append(interest24)
        self.interestStyles = []
        for i in 0..<23{
            self.interestStyles?.append(false)
        }

        
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           setupCollectionViewItemSize()
    }
       
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "InterestCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdintifier)
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat = 10
            
            let width = (collectionView.frame.width)/2 - 10
            let height: CGFloat = width/1.5
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        performSegue(withIdentifier: "influence", sender: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

extension InterestsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdintifier, for: indexPath) as! InterestCollectionViewCell
        cell.image.image = UIImage(named: interests[indexPath.item].image)
        cell.label.text = interests[indexPath.item].label
        if interests[indexPath.item].isSelected{
            cell.darkView.isHidden = true
            cell.blueView.isHidden = false
            cell.checkMark.isHidden = false
        } else {
            cell.darkView.isHidden = false
            cell.blueView.isHidden = true
            cell.checkMark.isHidden = true

        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
        print(interests)
        if !interests[indexPath.item].isSelected {
            interests[indexPath.item].isSelected = true
        } else {
            interests[indexPath.item].isSelected = false
        }
        collectionView.reloadItems(at: [indexPath])

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
        //        if (segue.identifier == "segueToChannelList") {
        //            print(throwableID)
        //            let vc = segue.destination as! aboutPackageViewController
        //            vc.packageID = self.throwableID
        //            vc.update()
    }
}
