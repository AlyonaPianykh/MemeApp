//
//  MemePreviewVC.swift
//  MeMeApp
//
//  Created by Alyonka on 9/14/16.
//  Copyright © 2016 OlenaPyanykh. All rights reserved.
//

import Foundation
import UIKit

class MemePreviewVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var meme : Meme?
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
      //  self.tabBarController?.tabBar.hidden = true
    
        if let meme = self.meme {
            self.imageView!.image = meme.memedImage
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    //    self.tabBarController?.tabBar.hidden = false
    }

}
