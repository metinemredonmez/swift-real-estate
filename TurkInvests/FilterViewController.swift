//
//  FilterViewController.swift
//  TurkInvests
//
//  Created by Emre on 12.02.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let pickerarray  = ["Istanbul", "Ankara","Izmir","Mugla","Antalya","Capodocia","Bodrum","Fethiye","Bursa","Mykonos","Mallorca","New York","London","Paris","Amsterdam","Lousanne","Monaco","Barcelona","Rio","LA","Toronto","Malaga","Madrid","Rome","ST.tropez","Cannes","Nice","ST Petersburg","Rhodes","Montenegro","Moscov","Berlin"]
    
    
    
    var beds1anyarray = [String]()
    var beds1array = [String]()
    var beds2array = [String]()
    var beds3array = [String]()
    var beds4array = [String]()
    var beds5array = [String]()
    
    // detail class ındaki filtreleme arraylari ! 
    
    
    var detailsArray = [DetailClass]()
    var selectedBeds:String = ""
    var selectedPrice:String = ""
    var selectedCity:String = ""
    var selectedFeetMinimum:String = "0"
    var selectedFeetMaximum:String = "90"
    
    
    
    
    
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var slideone: UISlider!
    @IBOutlet weak var segment1: UISegmentedControl!
    @IBOutlet weak var segment2: UISegmentedControl!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerlabel: UILabel!
    @IBOutlet weak var applybutton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        applybutton.layer.cornerRadius = 6.0
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    
    // query ile filtreleme blogu bu ! burada eklenme işlemleri mevcut
    
    @IBAction func applybutton(_ sender: Any) {

        SVProgressHUD.show(withStatus: "Searching for your Invest...")
        
        
        NSLog("SAVE")
        NSLog("Price:%@ Beds:%@ Feets:%@-%@ City:%@", selectedPrice,selectedBeds,selectedFeetMinimum,selectedFeetMaximum,selectedCity)
        
        let query = PFQuery(className: "Detail")
        
        if(!selectedCity.isEmpty){
            query.whereKey("city", contains:selectedCity)
            NSLog("# City Eklendi:%@",selectedCity)
        }
        if(!selectedPrice.isEmpty) {
            query.whereKey("pricenumber", lessThan: Int(selectedPrice) as Any)
            NSLog("# Price Eklendi:%@",selectedPrice)
        }
        if(!selectedFeetMinimum.isEmpty) {
            query.whereKey("sizevalue", greaterThan: selectedFeetMinimum)
            query.whereKey("sizevalue", lessThan: selectedFeetMaximum)
            NSLog("# Size Eklendi:%@-%@",selectedFeetMinimum,selectedFeetMaximum)
        }
        if(!selectedBeds.isEmpty) {
            query.whereKey("room", equalTo: selectedBeds)
            NSLog("# Bed Eklendi:%@",selectedBeds)
        }
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            } else {
                
                
                
                
                for object in objects!  {
                    let deger = object.object(forKey: "pricenumber")as! NSNumber
                    NSLog("OBJECT:%@", deger)
                }
                
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "filterResultsVC") as? FilterResultsViewController
                self.navigationController?.pushViewController(vc!, animated: true)
                var gelenSonuclar = [PFObject]()
                gelenSonuclar = objects!
                vc?.filtreSonuclari=gelenSonuclar
                
                
            }
        }
        
        SVProgressHUD.dismiss(withDelay: 2)
        
    }
    
    
    
    @IBAction func slideaction(_ sender: UISlider) {
        let slidevalue  = lroundf(sender.value)
        pricelabel.text = "\(slidevalue)"
        
        // EKLENEN
        selectedPrice=String(slidevalue)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerarray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerarray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerlabel.text = self.pickerarray[row]
        
        // EKLENEN
        selectedCity = self.pickerarray[row]
        
    }
    
    
    
    
    
    
    @IBAction func segment1action(_ sender: UISegmentedControl) {
        
        
        
        var  returnvalue = 6
        switch (segment1.selectedSegmentIndex) {
        case 0:
            
            returnvalue = beds1anyarray.count
            selectedBeds=""
            
            break
            
        case 1:
            
            // EKLENEN
            selectedBeds="1"
            returnvalue = beds1array.count
            break
            
        case 2:
            selectedBeds="2"
            returnvalue = beds2array.count
            break
            
        case 3:
            selectedBeds="3"
            returnvalue = beds3array.count
            break
            
            
        case 4:
            selectedBeds="4"
            returnvalue = beds4array.count
            break
            
        case 5:
            
            selectedBeds="5"
            returnvalue = beds5array.count
            break
            
        default: break
            
            
        }
        
        
        
    }
    
    
    @IBAction func segment2action(_ sender: UISegmentedControl) {
        
        switch (segment2.selectedSegmentIndex) {
        case 0:
            selectedFeetMinimum="0"
            selectedFeetMaximum="90"
            break
            
        case 1:
            selectedFeetMinimum="90"
            selectedFeetMaximum="120"
            break
            
        case 2:
            selectedFeetMinimum="120"
            selectedFeetMaximum="160"
            break
            
        case 3:
            selectedFeetMinimum="160"
            selectedFeetMaximum="200"
            break
            
            
        case 4:
            selectedFeetMinimum="200"
            selectedFeetMaximum="240"
            break
            
        case 5:
            selectedFeetMinimum="240"
            selectedFeetMaximum="99999999"
            break
        default: break
        }
        
    }
    
    @IBAction func applysearchaction(_ sender: Any) {
        
        
    }
    
    
}
