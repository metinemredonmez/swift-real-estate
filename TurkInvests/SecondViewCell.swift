//
//  SecondViewCell.swift
//  TurkInvests
//
//  Created by Emre on 28.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse


class SecondViewCell: UICollectionViewCell {
    
     @IBOutlet weak var imgview2: UIImageView!
     @IBOutlet weak var titlename: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    
        imgview2.layer.cornerRadius = 8.0
        contentView.layer.cornerRadius = 8.0
        
        
        titlename.layer.cornerRadius = 4.0
       
        
        
        
        
    }
    
    
    
    
    
    
}
