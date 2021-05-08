//
//  FirstViewCell.swift
//  TurkInvests
//
//  Created by Emre on 27.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse


class FirstViewCell: UICollectionViewCell {
    
     var objeID:String = ""
    
    
    @IBOutlet weak var titlename: UILabel!
    
  
    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var smalldes: UILabel!
    
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var numberview: UILabel!
    
    @IBOutlet weak var postbutton: UIButton!
    
    @IBOutlet weak var cityslabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        numberview.layer.cornerRadius = 4.0
        numberview.layer.shadowColor = UIColor.lightGray.cgColor
        numberview.layer.shadowRadius = 8.0
        numberview.layer.shadowOpacity = 2.0
        numberview.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    
        
        number.layer.cornerRadius = 4.0
        
    
       
        
        
        
        
        
        
    }
    
    
 
    
    
    
    
    
}
