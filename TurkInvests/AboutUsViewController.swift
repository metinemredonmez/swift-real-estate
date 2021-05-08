//
//  AboutUsViewController.swift
//  TurkInvests
//
//  Created by Emre on 29.01.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse


class AboutUsViewController: UIViewController {
    
    
    var textviewarray = [String]()
    
    

    @IBOutlet weak var textview: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        textviewdata()
        
        
        
    }
    
    
    
    func textviewdata() {
        
        let query = PFQuery(className: "contact")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
            }else {
                
                self.textviewarray.removeAll(keepingCapacity: false)
                
                for object in objects! {
                    
                    self.textviewarray.append(object.object(forKey: "titlename")as! String)
                    
                    self.textview.text = " \(self.textviewarray.last!)"
                }
            }
        }
    }

   
}
