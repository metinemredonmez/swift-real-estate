//
//  MapViewCell.swift
//  TurkInvests
//
//  Created by Emre on 1.01.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse


class MapViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var pricename: UILabel!
   
    
  
    @IBOutlet weak var img1: UIImageView!
    
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var hometypeandlocation: UILabel!
    
    
    @IBOutlet weak var starimg: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
        imgview.layer.cornerRadius = 8.0
        
        
        
        
        
        
        
        
        
    }
    
}
