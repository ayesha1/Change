//
//  CausesCollectionViewCell.swift
//  Change4Change
//
//  Created by Ayesha Khan on 7/28/18.
//  Copyright © 2018 Ayesha Khan. All rights reserved.
//

import UIKit

class CausesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text: String) {
        self.textLabel.text = text
    }

    func setPic(image: UIImage) {
        self.imageView.image = image
    }
}
