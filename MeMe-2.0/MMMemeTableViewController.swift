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
    }
    
    func openMemeDetail(using meme:MeMe) {
        
        let memeDetailController = storyboard?.instantiateViewController(withIdentifier: "MMMemeDetailViewController") as! MMMemeDetailViewController
        memeDetailController.meme = meme
        memeDetailController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(memeDetailController, animated: true)
    }
    
    func removeMeme(at index:Int) {
        
        savedMemes.remove(at:index)
        tableView.reloadData()
        
        // update Shared Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.savedMemes.remove(at:index)
    }
    
    // MARK: - TableView Datasource

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

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            removeMeme(at: indexPath.row)
        }
    }
    
}
