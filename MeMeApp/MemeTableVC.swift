//
//  MemeTableVC.swift
//  MeMeApp
//
//  Created by Alyonka on 9/13/16.
//  Copyright © 2016 OlenaPyanykh. All rights reserved.
//

import Foundation
import UIKit

class MemeTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes: [Meme]!
    
    @IBOutlet weak var noMemesLabel: UILabel!
    @IBOutlet weak var memeTableView: UITableView!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        memes = appDelegate.memes
        memeTableView.reloadData()
        self.tabBarController?.tabBar.hidden = false
        
        self.noMemesLabel.hidden = memes.count != 0
        self.memeTableView.hidden = memes.count == 0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell")!
        let meme = memes[indexPath.row]
        cell.textLabel?.text = meme.textTop
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:  NSIndexPath) {
        
        let previewController = self.storyboard!.instantiateViewControllerWithIdentifier("Preview") as! MemePreviewVC
        previewController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(previewController, animated: true)
        
    }
    
}