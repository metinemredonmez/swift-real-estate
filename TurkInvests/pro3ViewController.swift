//
//  pro3ViewController.swift
//  TurkInvests
//
//  Created by Emre on 10.10.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse


class pro3ViewController: UIViewController, UITextFieldDelegate, UIApplicationDelegate, UIScrollViewDelegate {
    
    var smaalArray = [String]()
    var imageArray = [PFFile]()
    var priceArray = [String]()
    var bigdesArray = [String]()
    var img1Array = [PFFile]()
    var img2Array = [PFFile]()
    var img3Array = [PFFile]()
    var img4Array = [PFFile]()
    var img5Array = [PFFile]()
    var img6Array = [PFFile]()
    
    var nearbyArray = [String]()
    var transportationArray = [String]()
    var trans1Array = [String]()
    var trans2Array = [String]()
    var trans3Array = [String]()
    var trans4Array = [String]()
    
    var buildignArray = [String]()
    var historyArray = [String]()
    
    


    
    
    
    @IBOutlet weak var pricename: UILabel!
    @IBOutlet weak var smalldes: UILabel!
    
    @IBOutlet weak var bigdes: UITextView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    
    
    @IBOutlet weak var nearby: UILabel!
    
    @IBOutlet weak var transportation: UILabel!
    
    
  
   
    @IBOutlet weak var trans1: UILabel!
    
    @IBOutlet weak var trans2: UILabel!
    @IBOutlet weak var trans3: UILabel!
    @IBOutlet weak var trans4: UILabel!
    @IBOutlet weak var history: UILabel!
    @IBOutlet weak var building: UILabel!
    
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        findplacesfromserver()
        
        
   
        
    }
    
  
    
    
    func getData() {
    
        
        let query = PFQuery(className: "Details")
        
        query.findObjectsInBackground { (objects, error) in
            
            
            
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                self.priceArray.removeAll(keepingCapacity: false)
                
                for object in objects! {
                
                    self.priceArray.append(object.object(forKey: "price") as! String)
                    
                    
                }
              
                
            }
        }
    
    }
    
    
 
    
    func findplacesfromserver () {
        
        let query  = PFQuery(className: "Details")
        
        
        query.findObjectsInBackground { (objects, error) in
            
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                
                for object in objects! {
                    
                    self.priceArray.append("")
                    self.smaalArray.append("smalldescription")
                    self.bigdesArray.append("bigdescription")
                    self.img1Array.append(object.object(forKey: "icon1") as! PFFile)
                    self.img2Array.append(object.object(forKey: "icon2") as! PFFile)
                    self.img3Array.append(object.object(forKey: "icon3") as! PFFile)
                    self.img4Array.append(object.object(forKey: "icon4") as! PFFile)
                    self.img5Array.append(object.object(forKey: "icon5") as! PFFile)
                    self.img6Array.append(object.object(forKey: "icon6") as! PFFile)
                    self.nearbyArray.append("nearby")
                    self.transportationArray.append("transport")
                    self.trans1Array.append("trans1")
                    self.trans2Array.append("trans2")
                    self.trans3Array.append("trans3")
                    self.trans4Array.append("trans4")
                    self.buildignArray.append("building_aminites")
                    self.historyArray.append("history")
                    
                    
                    
                    self.pricename.text = "$ 200.000: \(self.priceArray.last!)"
                    self.smalldes.text = "smalldescription: \(self.smaalArray.last!)"
                    self.bigdes.text = "bigdescription: \(self.bigdesArray.last!)"
                    self.nearby.text =   "nearby: \(self.nearbyArray.last!)"
                    self.transportation.text =  "transport: \(self.transportationArray.last!)"
                    self.trans1.text = "trans1: \(self.trans1Array.last!)"
                    self.trans2.text = "trans2: \(self.trans2Array.last!)"
                    self.trans3.text = "trans3: \(self.trans3Array.last!)"
                    self.trans4.text = "trans4: \(self.trans4Array.last!)"
                    
                    
                    
                    self.img1Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img1.image = UIImage(data: data!)
                            
                        }
                    })
     
                    self.img2Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img2.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    self.img3Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img3.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                    self.img4Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img4.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                    self.img5Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img5.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                    
                    self.img6Array.last?.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            
                            self.img6.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                }
                
                
            }
        }
        
        
    }
    
    @IBAction func likebutton(_ sender: Any) {
        
        
        
    }
    
}
