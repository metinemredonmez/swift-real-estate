//
//  FavoriTableViewController.swift
//  TurkInvests
//
//  Created by Turker Guney on 6.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD



class FavoriTableViewController: UITableViewController {
    
    

    var detailsArray = [DetailClass]()
    
    
    var choosenplace = ""
    var selected = ""
    var selectedplace = ""
    
  
    
    @objc var refresher = UIRefreshControl()

    
    @IBOutlet weak var tableview: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        addrefresh()
        
        
        
        tableview.delegate = self
        tableview.dataSource = self
        

        
        tableview.tableFooterView = UIView.init()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
 
       getdata()
        
        
    }
    

    
    func addrefresh()  {
        refresher.tintColor = UIColor.darkGray
        refresher.addTarget(self, action: #selector(refreshcontents), for: .valueChanged)
        refresher.attributedTitle = NSAttributedString(string: "Uploading Investment ...")
        
        if #available(iOS 10.0, *) {
            tableview.refreshControl = refresher
            
        }else {
            tableview.addSubview(refresher)
        }
        
    }
    
    @objc func refreshcontents()  {
        self.perform(#selector(finishedrefresh), with: nil, afterDelay: 1.0)
    }
    
    @objc func finishedrefresh() {
        refresher.endRefreshing()
        
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
                
                self.detailsArray.removeAll(keepingCapacity: false)
                
                
                if objects!.count > 0  {
                    
                     let currentUser = PFUser.current() ///diyoruz.
                    for object in objects! {
                        
                        let aDetailObj = DetailClass()
                        aDetailObj._objectId = object.objectId as! String
                        aDetailObj.titlename = object.object(forKey: "titlename") as! String
                        aDetailObj.pricename = object.object(forKey: "pricename") as! String
                        aDetailObj.smalldes = object.object(forKey: "smalldes") as! String
                        aDetailObj.image = object.object(forKey: "image")as? PFFile
                        aDetailObj.icon1 = object.object(forKey: "icon1") as? PFFile
                        aDetailObj.icon2 = object.object(forKey: "icon2") as? PFFile
                        aDetailObj.icon3 = object.object(forKey: "icon3") as? PFFile
                        aDetailObj.labelicon1 = object.object(forKey: "labelicon1")as! String
                        aDetailObj.labelicon2 = object.object(forKey: "labelicon2")as! String
                        aDetailObj.labelicon3 = object.object(forKey: "labelicon3")as! String
                        
                        if currentUser != nil {

                            if let mevcutLikes = currentUser!["likes"] as? Array<String>{
                                
                                if   mevcutLikes.contains(aDetailObj._objectId) {
                                    
                                    self.detailsArray.append(aDetailObj)
                                    
                                }else{
                                    
                                    ////favoriler'de ekli degil
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                
                // HIC FAVORI YOKSA BU BOLUM CALISIR   değer ölçü ve silme 
                
                if(self.detailsArray.count==0){
                    NSLog("FAVORI YOK")
                    let imageName = "savedhome1.png"
                    let image = UIImage(named: imageName)
                    let imageView = UIImageView(image: image!)
                    imageView.tag=908070
                    imageView.frame = CGRect(x: (self.view.frame.size.width / 2)-130, y: (self.view.frame.size.height / 2)-220, width: 250, height: 220)
                    self.view.addSubview(imageView)
                } else {
                    let imageView = self.view.viewWithTag(908070) as? UIImageView
                    imageView?.removeFromSuperview()
                }
                
                self.tableview.reloadData()
                
                
                
                
            }
        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        SVProgressHUD.show(withStatus: "")
        
        print("Selected row is", indexPath.row)
        
         self.selected = detailsArray[indexPath.row].titlename
        self.performSegue(withIdentifier: "fromfav", sender: self)
        
        SVProgressHUD.dismiss(withDelay: 0.3)
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromfav" {
            
            let destination = segue.destination as! DetailViewController
            destination.selectedplace = self.selected
            
            
        }
    }
    
    
 
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailsArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as!  FavTableViewCell
        
        
        ///hucrenin parent'i
        cell.parentVC = self
        
        
        cell.titlename.text = detailsArray[indexPath.row].titlename
        cell.pricename.text = detailsArray[indexPath.row].pricename
        cell.smalldes.text = detailsArray[indexPath.row].smalldes
        cell.label1.text = detailsArray[indexPath.row].labelicon1
        cell.label2.text = detailsArray[indexPath.row].labelicon2
        cell.label3.text = detailsArray[indexPath.row].labelicon3
        
        cell.objeID = detailsArray[indexPath.row]._objectId
        
        
        
        if let aImageData =  detailsArray[indexPath.row].image {
            aImageData.getDataInBackground { (data, error) in
                if error != nil {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }else {
                    
                    cell.imageview.image = UIImage(data: data!)
                    
                }
            }
        }
        
        
        if let aImageData1 =  detailsArray[indexPath.row].icon1 {
            aImageData1.getDataInBackground { (data, error) in
                if error != nil {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }else {
                    
                    cell.imgicon1.image = UIImage(data: data!)
                    
                }
            }
        }
        
        
        if let aImageData2 =  detailsArray[indexPath.row].icon2 {
            aImageData2.getDataInBackground { (data, error) in
                if error != nil {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }else {
                    
                    cell.imgicon2.image = UIImage(data: data!)
                    
                }
            }
        }
        
        if let aImageData3 =  detailsArray[indexPath.row].icon3 {
            aImageData3.getDataInBackground { (data, error) in
                if error != nil {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }else {
                    
                    cell.imgicon3.image = UIImage(data: data!)
                    
                    
                }
            }
        }
        
        cell.postbutton.tag = indexPath.row
        cell.postbutton.addTarget(self, action: #selector(postclicked(_:)), for: .touchUpInside)
        
        
        cell.postbutton.isEnabled = true
        
        return cell
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func postclicked(_ sender: UIButton) {
        
    
        
        
    }
    
    

    
    
    
    
    
}


