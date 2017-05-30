//
//  MMMemeTableViewCell.swift
//  MeMe-2.0
//
//  Created by Shyam on 30/05/17.
//  Copyright © 2017 Shyam. All rights reserved.
//

import UIKit

class MMMemeTableViewCell: UITableViewCell {

    // MARK: Outlet 
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Helper
    
    func setupCell(using meme:MeMe) {
        memeImageView.image = meme.memeImage
        topLabel.text = "Top Text - " + meme.topText
        bottomLabel.text = "Bottom Text - " + meme.bottomText
    }
    
}
