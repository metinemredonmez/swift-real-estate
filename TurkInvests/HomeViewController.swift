//
//  HomeViewController.swift
//  TurkInvests
//
//  Created by Emre on 16.09.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit
import Bolts
import Foundation
import SVProgressHUD



class HomeViewController: UIViewController, UIApplicationDelegate, UITextFieldDelegate, UIScrollViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    // one collection
    
    
      var titlearray = [String]()
      var pricearray = [String]()
      var numberaaray = [String]()
      var imagearray = [PFFile]()
      var smalldesarray = [String]()
      var labelarray1 = [String]()
      var labelarray2 = [String]()
      var labelarray3 = [String]()
      var icon1array = [PFFile]()
      var icon2array = [PFFile]()
      var icon3array = [PFFile]()
      var citysarray = [String]()
    
    
    
    // two collection
    
     var img2array = [PFFile]()
     var title2array = [String]()
    
   
    
     var fromfirst = ""
     var fromsecond = ""
    
  
    
    // sort segue
    
     var our = ""
    
    // homepage data
    
    var homearray1 = [String]()
    var homearray2 = [String]()
    var homearray3 = [String]()
    var homearray4 = [String]()
    
    var hotelimglabelarray = [String]()
    var yachtimglabelarray = [String]()
    
    var contactimgarray = [PFFile]()
    var hotelimagearray = [PFFile]()
    var yachtimagearray = [PFFile]()
    
    
    @IBOutlet weak var homelabel: UILabel!
    @IBOutlet weak var homelabel2: UILabel!
    @IBOutlet weak var homelabel3: UILabel!
    @IBOutlet weak var homelabel4: UILabel!
    
    @IBOutlet weak var hotelimglabel: UILabel!
    @IBOutlet weak var yachtimglabel: UILabel!
    
    @IBOutlet weak var contactimgblur: UIImageView!
    @IBOutlet weak var layoutview: UIView!
    
    //
    @IBOutlet weak var viewall1: UIButton!
    @IBOutlet weak var viewall2: UIButton!
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1;
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == collectionviewfirst {
            
            return titlearray.count
        }else   {
            return title2array.count
        }
      
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.collectionviewfirst {
        
            let cell : FirstViewCell  =   collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! FirstViewCell
            
           
            
            
            cell.titlename.text = titlearray[indexPath.row]
            cell.smalldes.text = smalldesarray[indexPath.row]
            cell.pricelabel.text = pricearray[indexPath.row]
            cell.number.text = numberaaray[indexPath.row]
            cell.label1.text = labelarray1[indexPath.row]
            cell.label2.text = labelarray2[indexPath.row]
            cell.label3.text = labelarray3[indexPath.row]
            cell.cityslabel.text = citysarray[indexPath.row]
            
        
            imagearray[indexPath.row].getDataInBackground { (data, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else  {
                    cell.imgview.image = UIImage(data: data!)
                    
                }
            }
            
            
            
            
            icon1array[indexPath.row].getDataInBackground { (data, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else  {
                    cell.img1.image = UIImage(data: data!)
                    
                }
            }
      
            
            
            icon2array[indexPath.row].getDataInBackground { (data, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else  {
                    cell.img2.image = UIImage(data: data!)
                    
                }
            }
            
            
            
            
            
            icon3array[indexPath.row].getDataInBackground { (data, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else  {
                    cell.img3.image = UIImage(data: data!)
                    
                }
            }
            
          
    
        
        cell.contentView.layer.cornerRadius = 6.0
        cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
       
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        
        
        return cell
            
        
            
            
            
        
        }else {
            let cell: SecondViewCell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! SecondViewCell
            
            cell.titlename.text = title2array[indexPath.row]
            
            
            
            
            img2array[indexPath.row].getDataInBackground { (data, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else  {
                    cell.imgview2.image = UIImage(data: data!)
                    
                }
            }
            
            
            
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
    
    }
    
    
   
  
    
    
    
    

    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    @IBOutlet weak var searchbutton: UIButton!
  
    @IBOutlet weak var searchview: UIView!
    
    @IBOutlet weak var filterbutton: UIButton!
    
    @IBOutlet weak var collectionviewfirst: UICollectionView!
    
    @IBOutlet weak var collectionviewprivate: UICollectionView!
    
    
    
    @IBOutlet weak var sortbutton: UIButton!
    
    // OTHERS CODE
    
    
    
    // home page data için kullanılacak
    
    @IBOutlet weak var hotelimg: UIImageView!
    @IBOutlet weak var yachimg: UIImageView!
 
    
    //
    
    @IBOutlet weak var mapbutton: UIButton!
    @IBOutlet weak var contacthere: UIButton!
    
    
    @IBOutlet weak var bluryachtingimg: UIImageView!
    @IBOutlet weak var bluryacheffect: UIVisualEffectView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbutton.layer.borderWidth = 0.5
        searchbutton.layer.borderColor = UIColor.lightGray.cgColor
        searchbutton.layer.cornerRadius = 4.0
        
        
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        
        getdata()
        
        getdata1()
        
        
        // home page data
        
        homepagedata()
        
        
        
        
        
        collectionviewfirst.dataSource = self
        collectionviewfirst.dataSource = self
        
        
        collectionviewprivate.dataSource = self
        collectionviewprivate.dataSource = self
        
        
        collectionviewfirst.layer.cornerRadius = 6.0
       
        
        collectionviewprivate.layer.cornerRadius = 6.0
       
        
        // view all layout others version !!
       /*
        viewall1.layer.cornerRadius = 4.0
        viewall1.layer.borderColor = UIColor.gray.cgColor
        viewall1.layer.borderWidth = 1.0
        
        viewall2.layer.cornerRadius = 4.0
        viewall2.layer.borderColor = UIColor.gray.cgColor
        viewall2.layer.borderWidth = 1.0
        
        */
        
        
        mapbutton.layer.cornerRadius = 18.0
        mapbutton.layer.shadowColor = UIColor.lightGray.cgColor
        mapbutton.layer.shadowRadius = 8.0
        mapbutton.layer.shadowOpacity = 2.0
        mapbutton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        contacthere.layer.cornerRadius = 8.0
        
        //
        /*
       
        hotelimg.layer.cornerRadius = 6.0
        hotelimg.layer.shadowColor = UIColor.lightGray.cgColor
        hotelimg.layer.shadowRadius = 8.0
        hotelimg.layer.shadowOpacity = 2.0
        hotelimg.layer.shadowOffset = CGSize(width: 0, height: 0)
        */
        
        
      
    
      
        hotelimg.layer.cornerRadius = 10.0
        hotelimg.layer.shadowColor = UIColor.lightGray.cgColor
        hotelimg.layer.shadowRadius = 8.0
        hotelimg.layer.shadowOpacity = 4.0
        hotelimg.layer.shadowOffset = CGSize(width: 0, height: 0)
        hotelimg.layer.masksToBounds = true
        
        
        ///
        
        
        
        
        
        yachimg.layer.cornerRadius = 12.0
        yachimg.layer.shadowColor = UIColor.lightGray.cgColor
        yachimg.layer.shadowRadius = 8.0
        yachimg.layer.shadowOpacity = 4.0
        yachimg.layer.shadowOffset = CGSize(width: 0, height: 0)
        yachimg.layer.masksToBounds = true
        
        
        
        
        
        ///
        
        bluryacheffect.layer.cornerRadius = 8.0
        bluryacheffect.layer.shadowColor = UIColor.lightGray.cgColor
        bluryacheffect.layer.shadowRadius = 8.0
        bluryacheffect.layer.shadowOpacity = 2.0
        bluryacheffect.layer.shadowOffset = CGSize(width: 0, height: 0)
        bluryacheffect.layer.masksToBounds = true
        
        
        
       
        
        
        bluryachtingimg.layer.cornerRadius = 8.0
        bluryachtingimg.layer.shadowColor = UIColor.lightGray.cgColor
        bluryachtingimg.layer.shadowRadius = 8.0
        bluryachtingimg.layer.shadowOpacity = 2.0
        bluryachtingimg.layer.shadowOffset = CGSize(width: 0, height: 0)
        bluryachtingimg.layer.masksToBounds = true
        
        
        
        
        
        
        
        searchview.layer.cornerRadius = 8.0
        searchview.layer.shadowColor = UIColor.lightGray.cgColor
        searchview.layer.shadowRadius = 8.0
        searchview.layer.shadowOpacity = 4.0
        searchview.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchview.layer.cornerRadius = 8.0
        searchview.layer.borderWidth = 0.5
        searchview.layer.borderColor = UIColor.lightGray.cgColor
        
      
  
  
        
    }
    

    
    
    @IBAction func logoutclicked(_ sender: Any)  {
    
    PFUser.logOutInBackground { (error) in
        if  error != nil {
            
            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okbutton)
            
            self.present(alert, animated: true, completion: nil)
        }else {
            
            UserDefaults.standard.removeObject(forKey: "user")
            UserDefaults.standard.synchronize()
            
            let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignIn") as! ViewController
            
            let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            delegate.window?.rootViewController = SignIn
            
            delegate.rememberUser()
            
            
        }
    }
    
    
    
}
    
    
    
   
    @IBAction func filteraction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "filter", sender: nil)
        
        
        
    }
    
    
    @IBAction func sortaction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "sort", sender: nil)
        
        
      
        
    }
    
    
    
    @IBAction func contactaction(_ sender: Any) {
        
    
    }
    

    // collection first data

    func getdata()  {
        
        let query = PFQuery(className: "Detail")
        query.whereKey("home1new", equalTo: "new")
        
    
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                  self.titlearray.removeAll(keepingCapacity: false)
                  self.pricearray.removeAll(keepingCapacity: false)
                  self.smalldesarray.removeAll(keepingCapacity: false)
                  self.numberaaray.removeAll(keepingCapacity: false)
                  self.labelarray1.removeAll(keepingCapacity: false)
                  self.labelarray2.removeAll(keepingCapacity: false)
                  self.labelarray3.removeAll(keepingCapacity: false)
                  self.imagearray.removeAll(keepingCapacity: false)
                  self.icon1array.removeAll(keepingCapacity: false)
                  self.icon2array.removeAll(keepingCapacity: false)
                  self.icon3array.removeAll(keepingCapacity: false)
                  self.citysarray.removeAll(keepingCapacity: false)
                
                
                
                
                
                if objects!.count > 0  {
                    
                    
                    
                    for object in objects! {
                        
                        
                        
                    
                            self.titlearray.append(object.object(forKey: "titlename") as! String)
                            self.pricearray.append(object.object(forKey: "pricename")as! String)
                            self.smalldesarray.append(object.object(forKey: "smalldes")as! String)
                            self.numberaaray.append(object.object(forKey: "number")as! String)
                            self.labelarray1.append(object.object(forKey: "labelicon1") as! String)
                            self.labelarray2.append(object.object(forKey: "labelicon2") as! String)
                            self.labelarray3.append(object.object(forKey: "labelicon3") as! String)
                            self.citysarray.append(object.object(forKey: "city")as! String)
                        
                        self.imagearray.append(object.object(forKey: "image")as! PFFile)
                        self.icon1array.append(object.object(forKey: "icon1")as! PFFile)
                        self.icon2array.append(object.object(forKey: "icon2")as! PFFile)
                        self.icon3array.append(object.object(forKey: "icon3")as! PFFile)
                        
                     
                    
                        
                        
                        
                        
                    }
                }
                
                
                self.collectionviewfirst.reloadData()
                
                
                
            }
        }
        
        
        
    }
    
    
    
    // collectionsecond data
    
    func getdata1()  {
        
        
        let query = PFQuery(className: "Detail")
        query.whereKey("home2new", equalTo: "new2")
        
        query.findObjectsInBackground { (objects, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
               
                
                  self.title2array.removeAll(keepingCapacity: false)
                  self.img2array.removeAll(keepingCapacity: false)
                
                
                
                if objects!.count > 0 {
                    
                    
                    for object in objects! {
                        
                      self.title2array.append(object.object(forKey: "titlename")as! String)
                      self.img2array.append(object.object(forKey: "image")as! PFFile)
                        
                      
                    }
                    
            }
            
                
                self.collectionviewprivate.reloadData()
                
          }
    
       }
    
    }
    
   
    
    
 
    
    @IBAction func contactbutton(_ sender: Any) {
  
    }
    
    
    @IBAction func hotelbutton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "fromhotel", sender: nil)
        
    }
    
    
    
    
    
    // yachting data
    @IBAction func privatebutton(_ sender: Any) {
        
       self.performSegue(withIdentifier: "fromyachting", sender: nil)
        
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionviewfirst {
  
             SVProgressHUD.show(withStatus: "")
            
        self.fromfirst = titlearray[indexPath.row]
        self.performSegue(withIdentifier: "fromfirst", sender: nil)
        
            
            SVProgressHUD.dismiss(withDelay: 0.3)
        }else {
        
             SVProgressHUD.show(withStatus: "")
            
            self.fromsecond = title2array[indexPath.row]
            self.performSegue(withIdentifier: "fromsecond", sender: nil)
        }
        
        SVProgressHUD.dismiss(withDelay: 0.3)
        
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromfirst"  {
           
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedplace = self.fromfirst
            
            
            
            
        }else if  segue.identifier == "fromsecond" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedplace = self.fromsecond
            
        }
    
    }
    
    
    
    
    
    func homepagedata()  {
        
        let query = PFQuery(className: "homepage")
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                self.homearray1.removeAll(keepingCapacity: false)
                self.homearray2.removeAll(keepingCapacity: false)
                self.homearray3.removeAll(keepingCapacity: false)
                self.homearray4.removeAll(keepingCapacity: false)
                
                self.hotelimagearray.removeAll(keepingCapacity: false)
                self.yachtimagearray.removeAll(keepingCapacity: false)
                self.hotelimglabelarray.removeAll(keepingCapacity: false)
                self.yachtimglabelarray.removeAll(keepingCapacity: false)
                self.contactimgarray.removeAll(keepingCapacity: false)
                
                
                
                for object in objects! {
                    
                    self.homearray1.append(object.object(forKey: "homelabel1")as! String)
                    self.homearray2.append(object.object(forKey: "homelabel2")as! String)
                    self.homearray3.append(object.object(forKey: "homelabel3")as! String)
                    self.homearray4.append(object.object(forKey: "homelabel4")as! String)
                    
                    self.hotelimagearray.append(object.object(forKey: "hotelimg")as! PFFile)
                    self.yachtimagearray.append(object.object(forKey: "yachtimg")as! PFFile)
                    
                    self.hotelimglabelarray.append(object.object(forKey: "hotelimglabel")as! String)
                    self.yachtimglabelarray.append(object.object(forKey: "yachtimglabel")as! String)
                    self.contactimgarray.append(object.object(forKey: "contactimg")as! PFFile)
                    
                    
                    
                    
                    
                    self.homelabel.text = "  \(self.homearray1.last!)"
                    self.homelabel2.text = "  \(self.homearray2.last!)"
                    self.homelabel3.text = "  \(self.homearray3.last!)"
                    self.homelabel4.text = "  \(self.homearray4.last!)"
                    
                    self.hotelimglabel.text = "  \(self.hotelimglabelarray.last!)"
                    self.yachtimglabel.text = "  \(self.yachtimglabelarray.last!)"

                    
                    
                    //
                    
                    self.hotelimagearray.last!.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                      
                        }else {
                             self.hotelimg.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                    self.contactimgarray.last!.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                            
                        }else {
                            self.contactimgblur.image = UIImage(data: data!)
                            
                        }
                    })
                    
                    
                    
                    self.yachtimagearray.last!.getDataInBackground(block: { (data, error) in
                        if error != nil {
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                            
                        }else {
                            self.yachimg.image = UIImage(data: data!)
                            
                        }
                    })
                    
                }
                
            }
        }
        
        
    }
    
    
    @IBAction func otherspropertiesbutton(_ sender: Any) {
        
        SVProgressHUD.show(withStatus: "")
         SVProgressHUD.dismiss(withDelay: 0.5)
        
    }
    
    
    
    
    @IBAction func mapaction(_ sender: Any) {
        
        
        
        SVProgressHUD.show(withStatus: "Invest Location")
        
      
        
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    
    
    @IBAction func viewone(_ sender: Any) {
        SVProgressHUD.show(withStatus: "")
        
        
        
        SVProgressHUD.dismiss(withDelay: 1)
        
    }
    
    
    @IBAction func viewtwo(_ sender: Any) {
        
        
        SVProgressHUD.show(withStatus: "")
        
        
        
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
}
    
