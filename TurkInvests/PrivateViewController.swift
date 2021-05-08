//
//  PrivateViewController.swift
//  TurkInvests
//
//  Created by Metin Donmez on 20.04.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD


class PrivateViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    var detailsArray = [DetailClass]()
    
    var choosenplace = ""
    
    var selectedplace = ""
    
    var selected = ""
    
    
    // from detail from upload
    
    var detailselected = ""
    var uploadslected = ""
    
    
    // from detail 1 from upload two !! segue code
    var frombackdetail = ""
    var fromuploaddetail2 = ""
    
    // sort swgue
    // 1. our segue
    

    
    @objc var thepri = ""
    var pri  = ""
    
    

    @IBOutlet weak var mapbutton: UIButton!
    @IBOutlet weak var collectionview: UICollectionView!
    
     @objc var refresher = UIRefreshControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         privatedata()
        
         addrefresh()
       

        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
        collectionview.layer.cornerRadius = 8.0
      
        
        mapbutton.layer.cornerRadius = 18.0
        mapbutton.layer.shadowColor = UIColor.lightGray.cgColor
        mapbutton.layer.shadowRadius = 8.0
        mapbutton.layer.shadowOpacity = 2.0
        mapbutton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
       
        
   
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromfav" {
            
            let destination = segue.destination as! DetailViewController
            destination.selectedplace = self.selected
            
            
        }
    }
    
    
    
    
    
    
    func addrefresh()  {
        refresher.tintColor = UIColor.darkGray
        refresher.addTarget(self, action: #selector(refreshcontents), for: .valueChanged)
        refresher.attributedTitle = NSAttributedString(string: "Uploading Invesment ...")
        
        if #available(iOS 10.0, *) {
            collectionview.refreshControl = refresher
            
        }else {
            collectionview.addSubview(refresher)
        }
        
    }
    
    @objc func refreshcontents()  {
        self.perform(#selector(finishedrefresh), with: nil, afterDelay: 1.0)
    }
    
    @objc func finishedrefresh() {
        refresher.endRefreshing()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SVProgressHUD.show(withStatus: "")
        
        
        print("Selected row is", indexPath.row)
        
        self.selected = detailsArray[indexPath.row].titlename
        
        self.performSegue(withIdentifier: "fromfav", sender: nil)
        
        SVProgressHUD.dismiss(withDelay: 0.3)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.detailsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell6", for: indexPath) as!  PrivateViewCell
        
        // cell 'leri datada göstermek için eklenen veriler !!!
        
        // layout code
        
      
        
        
        
        
        cell.titlename.text = detailsArray[indexPath.row].titlename
        cell.pricename.text = detailsArray[indexPath.row].pricename
        cell.smalldes.text = detailsArray[indexPath.row].smalldes
        cell.label1.text = detailsArray[indexPath.row].labelicon1
        cell.label2.text = detailsArray[indexPath.row].labelicon2
        cell.label3.text = detailsArray[indexPath.row].labelicon3
        cell.city.text = detailsArray[indexPath.row].city
        
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
        
        
        
        let currentUser = PFUser.current()
        if currentUser != nil {
            
            
            
            if let mevcutLikes = currentUser!["likes"] as? Array<String>{
                if mevcutLikes.contains(detailsArray[indexPath.row]._objectId) {
                    cell.postbutton.isEnabled = false
                }else{
                    cell.postbutton.isEnabled = true
                }
            }
        }
        
        // collection layout design ! new
        
        cell.layer.cornerRadius = 8.0
        
        cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
    
    
    
    
    
    //
    
    
    func privatedata()  {
        
        
        let query = PFQuery(className: "Detail")
        
        query.whereKey("number", contains: "10")
        query.order(byAscending: "pricevalue")
        
        
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                self.detailsArray.removeAll(keepingCapacity: false)
                
                
                if objects!.count > 0  {
                    
                    
                    
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
                        aDetailObj.city = object.object(forKey: "city")as! String
                        
                        self.detailsArray.append(aDetailObj)
                        
                        
                        
                        
                    }
                }
                
                
                self.collectionview.reloadData()
                
                
                
            }
        }
        
        
        
    }
    
    
    @IBAction func cancelbutton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
