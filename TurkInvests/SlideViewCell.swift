//
//  SlideViewCell.swift
//  TurkInvests
//
//  Created by Emre on 9.02.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse



class SlideViewCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var titlename: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
 
        imgview.isUserInteractionEnabled = true
        
        
        let pinchgesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchgesture))
        imgview.addGestureRecognizer(pinchgesture)
        
        
        
        
    }
    
    
    @objc func pinchgesture(sender:UIPinchGestureRecognizer) {
        
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
        
    }
    
    
}
