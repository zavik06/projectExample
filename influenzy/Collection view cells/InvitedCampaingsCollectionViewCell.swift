//
//  InvitedCampaingsCollectionViewCell.swift
//  influenzy
//
//  Created by Влад  on 17.12.2019.
//  Copyright © 2019 WHIZZBEES. All rights reserved.
//

import UIKit

class InvitedCampaingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        // Initialization code
    }

}
