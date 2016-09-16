//
//  MemeCollectionVC.swift
//  MeMeApp
//
//  Created by Alyonka on 9/13/16.
//  Copyright © 2016 OlenaPyanykh. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionVC: UICollectionViewController {
    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let dimensionW = (self.view.frame.size.width - (2 * space)) / 3
       // let dimensionH = (self.view.frame.size.height - (2 * space)) / 3
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimensionW, dimensionW)
    }
    
    
    @IBOutlet weak var noMemeLabel: UILabel!
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        memes = appDelegate.memes
        self.collectionView?.reloadData()
        self.tabBarController?.tabBar.hidden = false
        
        self.noMemeLabel.hidden = memes.count != 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCell", forIndexPath: indexPath) as! MemeCollectionVCCell
        
        let meme = self.memes[indexPath.row]
        
        cell.text.text = meme.textTop
        cell.preview?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath) {
        
        let previewController = self.storyboard!.instantiateViewControllerWithIdentifier("Preview") as! MemePreviewVC
        previewController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(previewController, animated: true)
        
    }
    
    
}