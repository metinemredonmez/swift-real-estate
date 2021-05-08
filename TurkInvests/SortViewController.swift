//
//  SortViewController.swift
//  TurkInvests
//
//  Created by Emre on 22.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD



class SortViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    

  
 
    var high  = ""
    var low = ""
    var our = ""
    var best = ""
   
   
    
    var selectedplace = ""
    
    
    // tek array ile çekiliyor !!
    
    var ourarray  = [String]()
 


   
    @IBOutlet weak var tableview: UITableView!
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableview.delegate = self
        tableview.dataSource = self
        
     
        
        tableview.layer.cornerRadius = 6.0
        
   
        getdata()
        

        
    }
    
   
    
   
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnvalue = 3
        switch (tableView.numberOfSections) {
            
        case 0:
            
            returnvalue = ourarray.count
            break
        case 1:
            returnvalue = ourarray.count
            
            break
        case 2:
            returnvalue = ourarray.count
            break
        case 3:
            returnvalue = ourarray.count
            break
     
            
        default:
            break
        }
        
        
        return returnvalue
  
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SortCell
        
        
        cell.sortlabel.text = ourarray[indexPath.row]
   
        
        
        
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        
       
        
        
        if  ((tableView.indexPathForSelectedRow) != nil) {
            
            
             SVProgressHUD.show(withStatus: "Searching for your ideal Invest...")
        
            switch indexPath.row {
            case 0:
                
              
                self.high = self.ourarray[indexPath.row]
                self.performSegue(withIdentifier: "high", sender: nil)
       
                break
            // do this 1
            case 1:
                
                self.low = self.ourarray[indexPath.row]
                self.performSegue(withIdentifier: "low", sender: nil)
       
                break
                
            // do this 2
                
            case 2:
                
                self.our = self.ourarray[indexPath.row]
                self.performSegue(withIdentifier: "ourrecommded", sender: nil)
                break
                
            case 3:
                
                self.best = self.ourarray[indexPath.row]
                self.performSegue(withIdentifier: "thebest", sender: nil)
                break
                
            // do this 3
            default:
                
                
                break
                // default behaviour
                
            }
            
            
                
            }
        
        
        SVProgressHUD.dismiss(withDelay: 1.5)
        
        }
        
    
    
    
   
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (tableview.indexPathForSelectedRow) != nil {
        
        if  segue.identifier == "high" {
            let destinationVC = segue.destination as! LowtohighViewController
            destinationVC.highupload = self.high
    
        }else if  segue.identifier == "low" {
            let destinationVC = segue.destination as! HightolowViewController
            destinationVC.lowupload = self.low
    
    
        }else if segue.identifier == "ourrecommded" {
            let destinationVC = segue.destination as! OurRecommendViewController
            destinationVC.ourecommeded = self.our
            
            
        }else if segue.identifier == "thebest" {
            
            let destinationVC = segue.destination as! ThebestViewController
            destinationVC.thebest = self.best
            
        }
        
            
            
        }
 
        
        
    }
    
    
    
    func getdata()  {
        
        let query  = PFQuery(className: "sortlist")
       
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                self.ourarray.removeAll(keepingCapacity: false)
                
                for object in objects! {
                    
                    self.ourarray.append(object.object(forKey: "SortList")as! String)
                    
                    
                }
                
            }
            self.tableview.reloadData()
            
            
        }
    }
    
    
   
 
  

  
    
    
   
   
    
}
