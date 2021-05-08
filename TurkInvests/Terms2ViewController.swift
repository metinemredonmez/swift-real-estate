//
//  Terms2ViewController.swift
//  TurkInvests
//
//  Created by Emre on 2.03.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD


class Terms2ViewController: UIViewController {
    
    
    @IBOutlet weak var textfield: UITextView!
    
    
    @IBOutlet weak var donebuttonlayout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donebuttonlayout.layer.cornerRadius = 6.0
        
        
        
    }
    

    @IBAction func cancelbutton(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func donebutton(_ sender: Any) {
        
        
       
        let object  = PFObject(className: "terms")
        
        object["postcomment"] = textfield.text
        object["postowner"] = PFUser.current()?.username!
        
      SVProgressHUD.show(withStatus: "Acceptance of the terms and Conditions...")
        
        
        object.saveEventually { (success, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
             
                
            }else {
                
                print("success")
                
                SVProgressHUD.showInfo(withStatus: "Successful")
                SVProgressHUD.dismiss(withDelay: 2)
                
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
}
