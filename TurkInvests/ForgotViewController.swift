//
//  ForgotViewController.swift
//  TurkInvests
//
//  Created by Emre on 16.09.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import Bolts
import Foundation
import SVProgressHUD





class ForgotViewController: UIViewController, UITextFieldDelegate,UIApplicationDelegate {
    
    
    var user = NSUserName()
    
    @IBOutlet weak var usernametext: UITextField!
    
    @IBOutlet weak var sendbutton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendbutton.layer.cornerRadius = 6.0
        
        usernametext.layer.cornerRadius = 6
        

        // Do any additional setup after loading the view.
        
        
        usernametext.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernametext.resignFirstResponder()
        
        
        
        return true
        
    }

   
    
    @IBAction func sendclikced(_ sender: Any) {
        
        
         SVProgressHUD.show(withStatus: "")
        
        let user = PFUser()
        user.username = usernametext.text!
        
        
        PFUser.requestPasswordResetForEmail(inBackground: usernametext.text!) { (success, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            } else {
                
                let alert = UIAlertController(title: "ok", message: "Password Sent to Email", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
                
                
            }
            
        }
        
         SVProgressHUD.dismiss(withDelay: 2)
        
    }
    
    
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
        
    }
}
    
  
