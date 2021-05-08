//
//  FavoriteTableViewController.swift
//  TurkInvests
//
//  Created by Emre on 30.11.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse


class FavoriteTableViewController: UITableViewController {
    
    
    var myFavorites: [PFObject] = []
    
    
    
    
    
    
    
    
    
    var titleArray = [String]()
    var priceArray = [String]()
    var smallArray = [String]()
    var imageArray = [PFFile]()
    
    var img1Array = [PFFile]()
    var img2Array = [PFFile]()
    var img3Array = [PFFile]()
    
    var label1Array = [String]()
    var label2Array = [String]()
    var label3Array = [String]()
    
    
    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getdata()
        
        
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func getdata()  {
        
        
        let query = PFQuery(className: "Detail")
        query.addAscendingOrder("createdAt")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                
                self.titleArray.removeAll(keepingCapacity: false)
                self.priceArray.removeAll(keepingCapacity: false)
                self.smallArray.removeAll(keepingCapacity: false)
                self.imageArray.removeAll(keepingCapacity: false)
                self.img1Array.removeAll(keepingCapacity: false)
                self.img2Array.removeAll(keepingCapacity: false)
                self.img3Array.removeAll(keepingCapacity: false)
                self.label1Array.removeAll(keepingCapacity: false)
                self.label2Array.removeAll(keepingCapacity: false)
                self.label3Array.removeAll(keepingCapacity: false)
                
                
                
                if objects!.count > 0  {
                    
                    
                    for object in objects! {
                        
                        self.titleArray.append(object.object(forKey: "titlename") as! String)
                        self.priceArray.append(object.object(forKey: "pricename")as! String)
                        self.smallArray.append(object.object(forKey: "smalldes")as! String)
                        
                        self.imageArray.append(object.object(forKey: "image")as! PFFile)
                        
                        self.img1Array.append(object.object(forKey: "icon1")as! PFFile)
                        self.img2Array.append(object.object(forKey: "icon2")as! PFFile)
                        self.img3Array.append(object.object(forKey: "icon2")as! PFFile)
                        self.label1Array.append(object.object(forKey: "labelicon1")as! String)
                        self.label2Array.append(object.object(forKey: "labelicon1")as! String)
                        self.label3Array.append(object.object(forKey: "labelicon1")as! String)
                        
                        
                        
                    }
                }
                
                
                self.tableview.reloadData()
                
                
            }
        }
        
        
        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  UploadCell
        
        // cell 'leri datada göstermek için eklenen veriler !!!
        
        
        
        
        
        
        cell.titlename.text = titleArray[indexPath.row]
        cell.pricename.text = priceArray[indexPath.row]
        cell.smalldes.text = smallArray[indexPath.row]
        cell.label1.text = label1Array[indexPath.row]
        cell.label2.text = label2Array[indexPath.row]
        cell.label3.text = label3Array[indexPath.row]
        
        
        
        
        
        imageArray[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                cell.imageview.image = UIImage(data: data!)
                
            }
        }
        
        img1Array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                cell.imgicon1.image = UIImage(data: data!)
                
            }
        }
        
        img2Array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                cell.imgicon2.image = UIImage(data: data!)
                
            }
        }
        
        img3Array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                cell.imgicon3.image = UIImage(data: data!)
                
                
                
                
            }
        }
        
        
        
        
        return cell
        
    }




}
