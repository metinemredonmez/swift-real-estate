//
//  MapViewController.swift
//  TurkInvests
//
//  Created by Emre on 30.12.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import MapKit
import SVProgressHUD

// map view search add !!!




class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate , UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    var coordinates: [[Double]]!
    var names:[String]!
    var addresses:[String]!
    var phones:[String]!
    

    @IBOutlet weak var starimg: UIImageView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        SVProgressHUD.show(withStatus: "")
        
        self.choosenplace = titlearray[indexPath.row]
        self.performSegue(withIdentifier: "frommapdetail", sender: nil)
        
        
        SVProgressHUD.dismiss(withDelay: 0.3)
        
    }
    
 
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlearray.count
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell =  collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MapViewCell
        
        
        cell.layer.cornerRadius = 8.0
        
        
        
        cell.titlename.text = titlearray[indexPath.row]
        cell.pricename.text = pricearray[indexPath.row]
        
        cell.hometypeandlocation.text = hometypeandlocarray[indexPath.row]
        cell.label1.text = label1array[indexPath.row]
        cell.label2.text = label2array[indexPath.row]
        cell.label3.text = label3array[indexPath.row]
        
        
        
        imgarray[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.imgview.image = UIImage(data: data!)
                
                
            }
        }
        
        icon1array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.img1.image = UIImage(data: data!)
                
                
            }
        }
        
        icon2array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.img2.image = UIImage(data: data!)
                
                
            }
        }
        
        
        icon3array[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.img3.image = UIImage(data: data!)
                
                
            }
        }
        
        
        stararray[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                cell.starimg.image = UIImage(data: data!)
                
                
            }
        }
        
    
        
        
        return cell
        
    }
    
    

    
    
    var choosenplace = ""
    var selected = ""
    var selectedplace = ""
    

    
    
    
    
     var titlearray = [String]()
     var pricearray = [String]()
  
     var imgarray = [PFFile]()
     var hometypeandlocarray = [String]()
     var label1array = [String]()
     var label2array = [String]()
     var label3array = [String]()
    
    var icon1array = [PFFile]()
    var icon2array = [PFFile]()
    var icon3array = [PFFile]()
    
    var stararray = [PFFile]()
    
    
    
 
    
    
    
   // map code
    
    
    var choosenlatitude = ""
    var choosenlongitude = ""

    
    
    var latitudearray = [String]()
    var longitudearray = [String]()
    
   
    
    
    
    //
    
    
    var manager = CLLocationManager()
    var requestCLLocation = CLLocation()
    
    
      // text and searchbutton code
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var searchmapbutton: UIButton!
    
    
    
   
    @IBOutlet weak var mapview: MKMapView!
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        textfield.layer.cornerRadius = 20.0
        searchmapbutton.layer.cornerRadius = 20.0
        collectionview.layer.cornerRadius = 8.0
        
        
        
        
 
       
        coordinates = [[39.848552, 32.855052],
                       [39.848329,32.855081],
                       [40.884831, 29.205810],
                       
                       [41.033695, 29.157542],
                       
                       [40.246637, 29.088406],
                       
                       [40.991352, 29.227733],
                       [41.003008, 29.113718],
                       [41.030198, 29.165656],
                       [41.075644, 28.793577],
                       [41.050580, 28.761826],
                       [40.993376, 29.227571],
                       [41.060068, 28.978139],
                       [40.963211, 29.235133],
                       [41.032451, 29.157173],
                       [41.030150, 29.165558],
                       [41.047651, 28.760784],
                       [41.009740, 29.225251],
                       [41.009740, 29.225251],
                       [39.829247, 32.711888],
                       [39.829135, 32.712083],
                       [41.033928, 29.157805] ,
                       [41.071239, 28.794366],
                       [41.142462, 28.781782],
                       [40.997159, 29.226961],
                       [40.998134, 29.227676] ,
                       [40.982643, 29.259561],
                       [40.964483, 29.235144],
                       [40.983353, 29.046802],
                       [40.934659, 29.126177],
                       [38.436247, 27.181230],
                       [41.014934, 29.041923],
                       [40.937137, 29.136146],
                       [41.043077, 28.983015],
                       [40.914406, 29.159382],
                       [40.912867, 29.158035],
                       [41.077199, 28.971703],
                       [41.077110, 28.971434],
                       [41.076749, 28.972033],
                       [41.077265, 28.971505],
                       [40.914242, 29.159433],
                       [40.912966, 29.157937],
                       [40.914149, 29.159417],
                       [40.935820, 29.134483],
                       [40.936279, 29.134436],
                       [41.009628, 29.209781],
                       [41.025177, 29.227240],
                       [36.835626, 28.659329],
                       [38.642068, 34.831371],
                       [40.815770, 29.313768],
                       [40.870906, 29.233128],
                       [40.978008, 29.038491],
                       [40.971613, 28.874425],
                       [41.114391, 29.059821]]// Latitude,Longitude
        
       
        
        // 54
       
        
        names = ["Sinpaş altınoran ",
                 "Sinpaş altınoran ",
                 "Dap ıst marina",
                 "Sinpaş Aqua city",
                 "Bursa modern",
                 "Eagean village Sinpas",
                 "Finance city Sinpas",
                 "Sinpas gokroman",
                 "Sinpas is modern",
                 "Marina sinpas",
                 "Sinpas metrolife",
                 "Quenn Bomonti Sinpas Project",
                 "Sinpas country Project",
                 "Aqua city",
                 "Avangarden Sinpas",
                 "Bosphorus Project Sinpas",
                 "Sinaps eagean way",
                 "Eagean Provonce",
                 "Sinpaş incek Blue",
                 "Sinpas incek green",
                 "Sinpas Istanbul Places",
                 "Sinpas Work Modern Project",
                 "Sinpas karşıyaka Project",
                 "Sinpas koycagiz Project",
                 "Sinpas Lagun Project",
                 "Sinpas Liva Project",
                 "Sinpas Rumelia Project",
                 "Feneryolu Project",
                 "Adatepe Project",
                 "Dap Project Izmir",
                 "Dap validebag Places",
                 "Terrace tower",
                 "Taxim Petek Project",
                 "Adam kule Dap",
                 "Dalga Towers Dap",
                 "Z office Dap",
                 "Dap a  office",
                 "Dap bumerang office",
                 "Dap s office",
                 "Dap vazo Tower",
                 "Dap burgu Tower",
                 "Dap tango Tower",
                 "Dap royal center",
                 "Dap dragos Royal",
                 "Dap centro Futura",
                 "Dap selale Houses",
                 "Sedir Hotels Boutique",
                 "Capodocia Cave Hotels",
                 "Tuzla marine sailboats",
                 "Pendik marina Yachting",
                 "Fenerbahce Yachting",
                 "Atakoy Marine",
                 "Istinye marina"]
        
        // 52
        
        
        addresses = ["Ankara ",
                     "Ankara",
                     "İstanbul- Turkey",
                     "Istanbul",
                     "Bursa",
                     "Ankara",
                     "Istanbul",
                     "Istanbul",
                     "Istanbul",
                     "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Ankara",
                 "Ankara",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Izmir",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istnbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Mugla",
                 "Capodocia",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul",
                 "Istanbul"]
        
        // 54
        
        
        phones = ["+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59",
                  "+90 535 012 25 59"]
        
        // 54
        
        
        
       
        // 2
        
        for i in 0...52  {
            
            
            let coordinate = coordinates[i]
            let point = StarbucksAnnotation(coordinate: CLLocationCoordinate2D(latitude: coordinate[0] , longitude: coordinate[1] ))
            point.image = UIImage(named: "home1.png")
            point.name = names[i]
            point.address = addresses[i]
            
            point.phone = phones[i]
            
            self.mapview.addAnnotation(point)
        }
        // 3
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.015903, longitude: 29.062630), span: MKCoordinateSpan(latitudeDelta: 1.00, longitudeDelta: 1.00))
        self.mapview.setRegion(region, animated: true)
        

      
        
        findplaceserver()
        
   
        
        mapview.mapType = MKMapType.standard
        
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.layer.cornerRadius = 6.0
        
        
     
        
  
    
    
 }
    
    
  
    
    @objc func callPhoneNumber(sender: UIButton)
    {
        
        let v = sender.superview as! CustomCalloutView
        if let url = URL(string: "telprompt://\(v.starbucksPhone.text!)"), UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.openURL(url)
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "frommapdetail" {
            
            let destination = segue.destination as! DetailViewController
            destination.selectedplace = self.choosenplace
            
            
        }
    }
    
    
    
    
    
    // others data
    
    func findplaceserver()    {
        
        let query = PFQuery(className: "Detail")
        query.whereKey("map", equalTo: "data")
        query.limit = 30;
        
      
        
         query.findObjectsInBackground { (objects, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else  {
                
                self.titlearray.removeAll(keepingCapacity: false)
                self.pricearray.removeAll(keepingCapacity: false)
               
                self.hometypeandlocarray.removeAll(keepingCapacity: false)
                self.label1array.removeAll(keepingCapacity: false)
                self.label2array.removeAll(keepingCapacity: false)
                self.label3array.removeAll(keepingCapacity: false)
                
                self.icon1array.removeAll(keepingCapacity: false)
                self.icon2array.removeAll(keepingCapacity: false)
                self.icon3array.removeAll(keepingCapacity: false)
                
                self.imgarray.removeAll(keepingCapacity: false)
                
                self.stararray.removeAll(keepingCapacity: false)
            
                
                
            
                
                
                for object in objects!  {
                    
                    self.titlearray.append(object.object(forKey: "titlename")as! String)
                    self.pricearray.append(object.object(forKey: "pricename")as! String)
                 
                    self.hometypeandlocarray.append(object.object(forKey: "type")as! String)
                    
                    self.label1array.append(object.object(forKey: "labelicon1")as! String)
                    self.label2array.append(object.object(forKey: "labelicon2")as! String)
                    self.label3array.append(object.object(forKey: "labelicon3")as! String)
                    
         
                    self.icon1array.append(object.object(forKey: "icon1")as! PFFile)
                    self.icon2array.append(object.object(forKey: "icon2")as! PFFile)
                    self.icon3array.append(object.object(forKey: "icon3")as! PFFile)
                    self.imgarray.append(object.object(forKey: "image")as! PFFile)
                    
                    self.stararray.append(object.object(forKey: "star")as! PFFile)
     
                    
                     self.manager.startUpdatingLocation()
                    
             
                }
                
            }
            
            
            
            self.collectionview.reloadData()
        }
        
    }
    
    @IBAction func cancelbutton(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
   

}



// map data

typealias MapViewDelegate = MapViewController
extension MapViewDelegate
{
    
    
    
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation
        {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil{
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = false
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "mp4")
        return annotationView
    }
    
    
    
    
    
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {
        // 1
        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }
        // 2
        let starbucksAnnotation = view.annotation as! StarbucksAnnotation
        let views = Bundle.main.loadNibNamed("CustomCalloutView", owner: nil, options: nil)
        let calloutView = views?[0] as! CustomCalloutView
        calloutView.starbucksName.text = starbucksAnnotation.name
        calloutView.starbucksAddress.text = starbucksAnnotation.address
        calloutView.starbucksPhone.text = starbucksAnnotation.phone
        calloutView.starbucksImage.image = starbucksAnnotation.image
        let button = UIButton(frame: calloutView.starbucksPhone.frame)
        button.addTarget(self, action: #selector(MapViewController.callPhoneNumber(sender:)), for: .touchUpInside)
        calloutView.addSubview(button)
        // 3
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
   
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
}
