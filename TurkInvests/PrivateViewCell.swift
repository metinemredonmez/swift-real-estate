//
//  PrivateViewCell.swift
//  TurkInvests
//
//  Created by Metin Donmez on 20.04.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD


class PrivateViewCell: UICollectionViewCell {
    
      var objeID:String = ""
    
    
    @IBOutlet weak var postbutton: UIButton!
    
    
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var pricename: UILabel!
    @IBOutlet weak var smalldes: UILabel!
    @IBOutlet weak var imgicon1: UIImageView!
    @IBOutlet weak var imgicon2: UIImageView!
    @IBOutlet weak var imgicon3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        contentView.layer.cornerRadius = 8.0
        imageview.layer.cornerRadius = 8.0
    
        
        
        
        
    }
    
    @IBAction func postclicked(_ sender: Any) {
        
        
        
        
        let currentUser = PFUser.current()
        if currentUser != nil {
            
            if var mevcutLikes = currentUser!["likes"] as? Array<String>{
                mevcutLikes.append(objeID)
                currentUser!["likes"] = mevcutLikes
                
            }else{
                currentUser!["likes"] = [objeID]
            }
            
            currentUser!.saveInBackground()
            postbutton.isEnabled = false
        }
        
    }
    
    
  
    
}
