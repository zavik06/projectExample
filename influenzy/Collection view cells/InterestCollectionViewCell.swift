//
//  InterestCollectionViewCell.swift
//  influenzy
//
//  Created by Влад  on 10.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkMark: UILabel!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        // Initialization code
    }

}
