//
//  MMMemeCollectionViewController.swift
//  MeMe-2.0
//
//  Created by Shyam on 30/05/17.
//  Copyright © 2017 Shyam. All rights reserved.
//

import UIKit

class MMMemeCollectionViewController: UICollectionViewController {

    // MARK: Outlet
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    
    // MARK: Model
    
    var savedMemes = [MeMe]()
    let CELL_IDENTIFIER = "MMMemeCollectionViewCell"
    
    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    // MARK: Helper
    
    func setupView() {
        
        let space:CGFloat = 4.0
        let dimension = ((collectionView?.frame.width)! / 3.0) - (3 * space)
        collectionViewFlowLayout.minimumLineSpacing = space
        collectionViewFlowLayout.minimumInteritemSpacing = space
        collectionViewFlowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        savedMemes = appDelegate.savedMemes
        collectionView?.reloadData()
    }

    func openMemeDetail(using meme:MeMe) {
        
        let memeDetailController = storyboard?.instantiateViewController(withIdentifier: "MMMemeDetailViewController") as! MMMemeDetailViewController
        memeDetailController.meme = meme
        memeDetailController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(memeDetailController, animated: true)
    }
    
    // MARK: CollectionView DataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedMemes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIER, for: indexPath) as! MMMemeCollectionViewCell
    
        // Populate Cell
        let meme = savedMemes[indexPath.row]
        cell.setupCell(using: meme)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let meme = savedMemes[indexPath.row]
        openMemeDetail(using: meme)
    }
}
