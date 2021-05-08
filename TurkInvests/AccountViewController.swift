//
//  AccountViewController.swift
//  TurkInvests
//
//  Created by Emre on 17.03.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import CoreData




class AccountViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    @IBOutlet weak var usertype: UILabel!
    
    
    
    @IBOutlet weak var editimg: UIImageView!
    @IBOutlet weak var editlabel: UILabel!
   
    @IBOutlet weak var letsbutton: UIButton!
    
    
    @IBOutlet weak var editbuttonlayour: UIButton!
    

    
    //homedata array
   
    var yachimgarray = [PFFile]()
    var yachlabelarray = [String]()
    
    
    
     var choosenplace = ""
     
    
    
    //edit array
    
    var usernamearray = [String]()
    var lastnamearray = [String]()
    var imgarray = [UIImage]()
    var userarray = [String]()
  
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          getinfo()
        
          homedata()
        
          editbuttonlayour.layer.cornerRadius = 4.0
          editbuttonlayour.layer.borderColor = UIColor.gray.cgColor
          editbuttonlayour.layer.borderWidth = 1.0
        
        
          imgview.layer.cornerRadius = imgview.frame.width / 2
        
          imgview.layer.borderColor = UIColor.blue.cgColor
         
        
        
        
          username.layer.cornerRadius = 6.0
          editimg.layer.cornerRadius = 8.0
          
          letsbutton.layer.cornerRadius = 6.0
        
    
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(AccountViewController.getinfo), name: NSNotification.Name(rawValue: "new"), object: nil)
        
        
    }
    
    

   
    @IBAction func editbutton(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "editprofile", sender: nil)
        
    }
    
    
   
    
    
  @objc  func getinfo() {
    
       usernamearray.removeAll(keepingCapacity: false)
       lastnamearray.removeAll(keepingCapacity: false)
       userarray.removeAll(keepingCapacity: false)
      
    
        
       let appdelegate = UIApplication.shared.delegate as! AppDelegate
       let context = appdelegate.persistentContainer.viewContext
        
       let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
       fetchrequest.returnsObjectsAsFaults = false
       
        do {
          
            let results = try context.fetch(fetchrequest)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let name =  result.value(forKey: "username") as? String {
                        self.usernamearray.append(name)
                        
                        self.username.text = "  \(self.usernamearray.last!)"
                    }
                    
                    
                    if let lastname =  result.value(forKey: "lastname") as? String {
                        self.lastnamearray.append(lastname)
                        
                         self.lastname.text = "  \(self.lastnamearray.last!)"
                    }
                    
                    
                   if let usertype  = result.value(forKey: "usertype") as? String {
                        self.userarray.append(usertype)
                        
                          self.usertype.text = "  \(self.userarray.last!)"
                    }
                    
 
                   
                }
                
                
            }
            
            
            
        }catch {
            
            
        }
        
        
      
       
        
    }

    
    
    
    
    // home data
    
    
    @objc func  homedata() {
        
        let query = PFQuery(className: "homepage")
      
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
            }else {
                
                if objects!.count > 0 {
                    
                    
                    
                    
                    for object in objects! {
                        
                        self.yachlabelarray.append(object.object(forKey: "editlabel")as! String)
                       
                        self.yachimgarray.append(object.object(forKey: "editimg")as! PFFile)
                        
                        
                        self.editlabel.text = "  \(self.yachlabelarray.last!)"
                     
            
                        
                        self.yachimgarray.last!.getDataInBackground(block: { (data, error) in
                            
                            if error != nil {
                                
                                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                                
                                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                                alert.addAction(okbutton)
                                
                                self.present(alert, animated: true, completion: nil)
                            }else {
                                self.editimg.image = UIImage(data: data!)
                                
                                
                            }
                            
                        })
                        
               
                        
                    }
                    
                }
                
            }
        }
    }
    
   
 
   
    
}
