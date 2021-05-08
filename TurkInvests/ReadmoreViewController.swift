//
//  ReadmoreViewController.swift
//  TurkInvests
//
//  Created by Emre on 2.01.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse





class ReadmoreViewController: UIViewController  {
    

    var descarray = [String]()
    
    
      var selectedall = ""
      var selectedread = ""
    
    
    @IBOutlet weak var textlabel: UITextView!
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        gedata()
        
  
        
        
    }
    

  
    
    
   @objc func gedata()    {
        
        
        let query =  PFQuery(className: "Detail")
    
      query.whereKey("titlename", equalTo: self.selectedread)
    
    
  
        query.findObjectsInBackground { (objects, error ) in
            if error != nil  {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                self.descarray.removeAll(keepingCapacity: false)
                
                
                
                
                for object in objects! {
                    
                    self.descarray.append(object.object(forKey: "read_all")as! String)
                    
                    self.textlabel.text = " \(self.descarray.last!)"
                
                    
                
                    
                    }
                    
          
                
            }
            
            
       
            
        }
        
        
        
        
        
    }

    @IBAction func cancelbutton(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
}
