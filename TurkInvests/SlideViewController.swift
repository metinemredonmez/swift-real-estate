//
//  SlideViewController.swift
//  TurkInvests
//
//  Created by Emre on 9.02.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse


class SlideViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
  
    
    
    var arrayYeni = [PFFile]()
    var arrayYeniTitle = [String]()
    
    var titlearray = [String]()
    var imgarray1 = [PFFile]()
    var imgarray2 = [PFFile]()
    var imgarray3 = [PFFile]()
    
    
    var selectedimg = ""
    var selectedslayt = ""
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getdata()
        
        
        
        
        
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
        self.collectionview.minimumZoomScale = 1.0
        self.collectionview.maximumZoomScale = 6.0
        
        
        
        
    }
    

    
    
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.arrayYeni.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SlideViewCell
        
        // VERİLERDE BAZEN IMAJ GELIYOR AMA TITLE BULUNMUYOR. BU DURUMDA TITLE KISMI BOS GEÇİLMESİ İÇİN COUNT HESAPLAMASI YAPILIYOR
        if(arrayYeniTitle.count>=indexPath.row+1) {
            cell.titlename.text = arrayYeniTitle[indexPath.row]
        } else {
            cell.titlename.text=""
        }
        
        
        self.arrayYeni[indexPath.row].getDataInBackground { (data, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.imgview.image = UIImage(data: data!)
            }
        }
        
        
        return cell
        
        
    }
    
    
    
    @objc func getdata()   {
        
        
        
        let query = PFQuery(className: "Detail")
        
        
        query.whereKey("titlename", equalTo: self.selectedslayt)
        
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else  {
                
                self.titlearray.removeAll(keepingCapacity: false)
                self.imgarray1.removeAll(keepingCapacity: false)
                self.imgarray2.removeAll(keepingCapacity: false)
                self.imgarray3.removeAll(keepingCapacity: false)
                
                
                for object in objects!  {
                    
                    
                    if(object.object(forKey: "titlename") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename")as! String)
                    }
                    if(object.object(forKey: "titlename2") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename2")as! String)
                    }
                    if(object.object(forKey: "titlename3") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename3")as! String)
                    }
                    if(object.object(forKey: "titlename4") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename4")as! String)
                    }
                    if(object.object(forKey: "titlename5") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename5")as! String)
                    }
                    if(object.object(forKey: "titlename6") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename6")as! String)
                    }
                    if(object.object(forKey: "titlename7") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename7")as! String)
                    }
                    if(object.object(forKey: "titlename8") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename8")as! String)
                    }
                    if(object.object(forKey: "titlename9") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename9")as! String)
                    }
                    if(object.object(forKey: "titlename10") is String) {
                        self.arrayYeniTitle.append(object.object(forKey: "titlename10")as! String)
                    }
                    
                    
                    
                    if(object.object(forKey: "slayt1") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt1")as! PFFile)
                    }
                    if(object.object(forKey: "slayt2") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt2")as! PFFile)
                    }
                    if(object.object(forKey: "slayt3") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt3")as! PFFile)
                    }
                    if(object.object(forKey: "slayt4") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt4")as! PFFile)
                    }
                    if(object.object(forKey: "slayt5") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt5")as! PFFile)
                    }
                    if(object.object(forKey: "slayt6") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt6")as! PFFile)
                    }
                    if(object.object(forKey: "slayt7") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt7")as! PFFile)
                    }
                    if(object.object(forKey: "slayt8") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt8")as! PFFile)
                    }
                    if(object.object(forKey: "slayt9") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt9")as! PFFile)
                    }
                    if(object.object(forKey: "slayt10") is PFFile) {
                        self.arrayYeni.append(object.object(forKey: "slayt10")as! PFFile)
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

// layout code !!! burada ki kodlar düzgün slayt geçişleri için constraint hariç !!

extension SlideViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
        
    }
}

