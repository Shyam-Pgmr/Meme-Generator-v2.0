//
//  MMMemeCollectionViewCell.swift
//  MeMe-2.0
//
//  Created by Shyam on 30/05/17.
//  Copyright © 2017 Shyam. All rights reserved.
//

import UIKit

class MMMemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    func setupCell(using meme:MeMe) {
        memeImageView.image = meme.memeImage
    }
    
}
