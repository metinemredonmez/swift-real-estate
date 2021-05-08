//
//  DetailViewCell.swift
//  TurkInvests
//
//  Created by Emre on 27.01.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse


class DetailViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var labelcollection: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      // new version 1.1.1 ! code
        
     imgview.layer.cornerRadius = 6.0
        
        
 
        
        
    }
    
}
