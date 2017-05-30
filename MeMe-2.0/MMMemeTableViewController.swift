//
//  MMMemeTableViewController.swift
//  MeMe-2.0
//
//  Created by Shyam on 30/05/17.
//  Copyright © 2017 Shyam. All rights reserved.
//

import UIKit

class MMMemeTableViewController: UITableViewController {

    // MARK: Model
    
    var savedMemes = [MeMe]()
    let CELL_IDENTIFIER = "MMMemeTableViewCell"
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    // MARK: Helper
    
    func setupView() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        savedMemes = appDelegate.savedMemes
        tableView.reloadData()
        
        if savedMemes.count == 0 {

            // Show Editor Screen
            let editorController = storyboard?.instantiateViewController(withIdentifier: "MMEditorViewController") as! MMEditorViewController
            present(UINavigationController.init(rootViewController: editorController), animated: false, completion: nil)
        }
    }
    
    func openMemeDetail(using meme:MeMe) {
        
        let memeDetailController = storyboard?.instantiateViewController(withIdentifier: "MMMemeDetailViewController") as! MMMemeDetailViewController
        memeDetailController.meme = meme
        navigationController?.pushViewController(memeDetailController, animated: true)
    }
    
    // MARK: - TableView Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedMemes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! MMMemeTableViewCell

        // Populate Cell
        let meme = savedMemes[indexPath.row]
        cell.setupCell(using: meme)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // MARK: - TableView Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let meme = savedMemes[indexPath.row]
        openMemeDetail(using: meme)
    }

}
