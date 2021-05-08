//
//  FavTableViewCell.swift
//  TurkInvests
//
//  Created by Turker Guney on 6.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

class FavTableViewCell: UITableViewCell {
    
    
    var parentVC:FavoriTableViewController!
    
    var objeID:String = ""
    
   
   
   
    
    @IBOutlet weak var postbutton: UIButton!
    
    
    
    
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var pricename: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var smalldes: UILabel!
    @IBOutlet weak var imgicon1: UIImageView!
    @IBOutlet weak var imgicon2: UIImageView!
    @IBOutlet weak var imgicon3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var layoutview: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
        layoutview.layer.cornerRadius = 8.0
        layoutview.layer.borderWidth = 1.0
        layoutview.layer.borderColor = UIColor.lightGray.cgColor
        
        
        imageview.layer.cornerRadius = 6.0
        
     
        
        
        
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    
    
    
    @IBAction func postclicked(_ sender: Any) {
        
        SVProgressHUD.show(withStatus: "Unlike")
        
        postbutton.isEnabled = false
        let currentUser = PFUser.current()
        if currentUser != nil {
            
            if var mevcutLikes = currentUser!["likes"] as? Array<String>{
                let indexNumarasi = mevcutLikes.firstIndex(of: objeID)! ///arraydeki index numarasını bul
                mevcutLikes.remove(at: indexNumarasi) //index'e göre Sil
                
                currentUser!["likes"] = mevcutLikes //kalanı server'a gönder
                
            }else{
                ////likes array boş
            }
            
            currentUser!.saveInBackground(block: {result,err in
                if result {
                    self.parentVC.getdata()
                }else{
                    print("hata")
                }
            })
            
            
            
        }
       
        SVProgressHUD.dismiss(withDelay: 0.3)
    }
    
    
    
}








