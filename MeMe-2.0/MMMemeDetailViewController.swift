//
//  MMMemeDetailViewController.swift
//  MeMe-2.0
//
//  Created by Shyam on 30/05/17.
//  Copyright © 2017 Shyam. All rights reserved.
//

import UIKit

class MMMemeDetailViewController: UIViewController {

    // MARK: Outlet
    
    @IBOutlet weak var memeImageView:UIImageView!
    
    // MARK: Model
    
    var meme:MeMe!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: Helper
    
    func setupView() {
        self.title = "Meme Detail"
        memeImageView.image = meme.memeImage
    }

}
