//
//  EditViewController.swift
//  TurkInvests
//
//  Created by Emre on 17.03.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import CoreData
import SVProgressHUD
import StoreKit


class EditViewController: UIViewController  {
    
    
    var choosenplace = ""
    
    
    
    @IBOutlet weak var imgview: UIImageView!

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var usertype: UITextField!
   
    
    @IBOutlet weak var savebuttonlayout: UIButton!
    
    
    var usernamearray = [String]()
    var lastnamearray = [String]()
    var imgarray = [UIImage]()
    var usertypearray = [String]()
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        savebuttonlayout.layer.cornerRadius = 8.0
        
        imgview.layer.cornerRadius = imgview.frame.width / 2
      
        imgview.layer.borderColor = UIColor.blue.cgColor
       
   
   
       
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            
        }else {
            print("success")
            // fallback eralier version
        }
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    


   
    @IBAction func changebuttonclicked(_ sender: Any) {
        
      
        
        
        
    }
    
    @IBAction func savebutton(_ sender: Any) {
        
        SVProgressHUD.show(withStatus: "")
 
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let newobject = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: context)
        
        newobject.setValue(username.text, forKey: "username")
        newobject.setValue(lastname.text, forKey: "lastname")
        newobject.setValue(usertype.text, forKey: "usertype")
       
        
        
        do {
            
            try  context.save()
            print("No Error")
            
            
        }catch {
            print("Error")
            
        }
        
     
        
     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "new"), object: nil)
        
          self.dismiss(animated: true, completion: nil)
        
        SVProgressHUD.dismiss(withDelay: 1.5)
        
        
        
    }
    
    
   
    
    
    @IBAction func cancelbutton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
