//
//  Terms1ViewController.swift
//  TurkInvests
//
//  Created by Emre on 23.03.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse



class Terms1ViewController: UIViewController {
    
    @IBOutlet weak var titlename: UITextView!
    
    var privacyarray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       getdata()
        
        
        
    }
    
    @objc func getdata()   {
        
        
        
        let query = PFQuery(className: "contact")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                self.privacyarray.removeAll(keepingCapacity: false)
                
                for object in objects! {
                    
                    self.privacyarray.append(object.object(forKey: "privacy")as! String)
                    
                    self.titlename.text = " \(self.privacyarray.last!)"
                    
                }
                
            }
        }
        
        
        
    }
   

}
