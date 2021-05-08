//
//  DetailViewController.swift
//  TurkInvests
//
//  Created by Emre on 18.11.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import Parse
import MapKit
import Social
import SVProgressHUD





class DetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UIScrollViewDelegate , UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    
    
  // apple stroe için link ..... (  final private let  stringwithlink = "Please download this app here in App Store: "https://google.com")
    
    // details segue code
    @objc var selectedplace = ""
    var selected = ""
    
   
    var choosenlatitude = ""
    var choosenlongitude = ""
    
 
  // from detail from upload
    
    var detailselected =   ""
    
  // img slide
    
    var selectedimg = "" 
   
    
    // read all segue code
    var selectedall = ""
    
 
    
    // slideshow
    
    var slideshow = ""
    
    
    
    // collectionview code
    
    @IBOutlet weak var collectionview: UICollectionView!
    

    
    
    
    // new button the soon button!!
    
    @IBOutlet weak var contactbutton: UIButton!
    
 
    
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var pricename: UILabel!
    @IBOutlet weak var smalldes: UILabel!
    @IBOutlet weak var bigdes: UILabel!
    
    @IBOutlet weak var nearby1: UILabel!
    @IBOutlet weak var nearby2: UILabel!
    
    @IBOutlet weak var trans1: UILabel!
    @IBOutlet weak var trans2: UILabel!
    @IBOutlet weak var mapview: MKMapView!
    

    
    
    // ekleneneler
    
    @IBOutlet weak var imgicon1: UIImageView!
    @IBOutlet weak var imgicon2: UIImageView!
    @IBOutlet weak var imgicon3: UIImageView!
    
    
    
    // nearby ve transportation iconları
    
    @IBOutlet weak var imgicon4: UIImageView!
    @IBOutlet weak var imgicon5: UIImageView!
    
    @IBOutlet weak var imgicon6: UIImageView!
    @IBOutlet weak var imgicon7: UIImageView!
    
    
    // map icon 
 
    @IBOutlet weak var imgicon8: UIImageView!
    
    // share button
    
    @IBOutlet weak var sharebutton: UIButton!
    
    @IBOutlet weak var labelicon1: UILabel!
    @IBOutlet weak var labelicon2: UILabel!
    @IBOutlet weak var labelicon3: UILabel!
    
    

    
    // scrollbutton
    
    
    @IBOutlet weak var readAll: UIButton!
    
    @IBOutlet weak var scrollbutton: UIButton!
    
    
    
    // citys
    
    @IBOutlet weak var citys: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    
    // new code extra special
    
    @IBOutlet weak var rooms: UILabel!
    @IBOutlet weak var bedrooms: UILabel!
    @IBOutlet weak var bathroom: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var heating: UILabel!
    
    @IBOutlet weak var agencydes: UILabel!
    @IBOutlet weak var agencyimg: UIImageView!
    
    
    
    //agency array
    
    var agencyimgarray = [PFFile]()
    var agencydesarray = [String]()
    
    
    var titleArray = [String]()
    var priceArray = [String]()
    var imageArray = [PFFile]()
    var smallArray = [String]()
    
    var bigdesArray = [String]()
    var nearby1Array = [String]()
    var nearby2Array = [String]()
    
    var trans1Array = [String]()
    var trans2Array = [String]()
    

    
    
    
    var manager = CLLocationManager()
    var requestCLLocation = CLLocation()
    
    
   
    
    
    
    // eklenenenler
    
     var imgiconArray1 = [PFFile]()
     var imgiconArray2 = [PFFile]()
     var imgiconArray3 = [PFFile]()
     var labelicon1Array = [String]()
     var labelicon2Array = [String]()
     var labelicon3Array = [String]()
    
     var imgiconArray4 = [PFFile]()
     var imgiconArray5 = [PFFile]()
     var imgiconArray6 = [PFFile]()
     var imgiconArray7 = [PFFile]()
     var imgiconArray8 = [PFFile]()
    
     var latitudearray = [String]()
     var longitudearray = [String]()
    
    
    // others
    
    var citysarray = [String]()
    
    
    // part 2
    
    
    
    var titlehotel = [String]()
    var pricehotel = [String]()
    var imagehotel = [PFFile]()
    var smallhotel = [String]()
    
    var bigdeshotel = [String]()
    var nearby1hotel = [String]()
    var nearby2hotel = [String]()
    
    var trans1hotel = [String]()
    var trans2hotel = [String]()
    
    
    
    
    
    // eklenenenler
    
    var imgiconhotel1 = [PFFile]()
    var imgiconhotel2 = [PFFile]()
    var imgiconhotel3 = [PFFile]()
    var labelicon1hotel = [String]()
    var labelicon2hotel = [String]()
    var labelicon3hotel = [String]()
    

    
    var latitudehotel = [String]()
    var longitudehotel = [String]()
    
    
   // new code details
    
    var roomarray = [String]()
    var bedroomarray = [String]()
    var bathroomarray = [String]()
    var sizearray = [String]()
    var heatingarray = [String]()
    
    
    // collectionview array code

    var collectiontitlearray = [String]()
    var collectionimagearray = [PFFile]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
        setupViews()
    }
    
    /* func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let yoffset = self.scrollview.contentOffset.y * 0.2
        let availableoffset = min(yoffset , 60)
        let contentrectyoffset = availableoffset / bigdes.frame.size.height
        bigdes.layer.contentsRect  = CGRectMake(0.0, contentrectyoffset, 1, 1);
    }

    */
    
   

    

    override func viewDidLoad() {

        super.viewDidLoad()

        
    
        contactbutton.layer.cornerRadius = 6.0
        scrollview.delegate = self
        

        
        
        mapview.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
       
        
        
        imageview.isUserInteractionEnabled = true
        
        let gestureracognizer = UITapGestureRecognizer(target: self, action: #selector(getter: DetailViewController.selectedplace))
       
        imageview.addGestureRecognizer(gestureracognizer)
        
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
       
     
        
        getdatacollection()
        
        // data code
        getdata()
     
       // getdatadetail1() diğer projedeki data
        
        
       
    }
    
    
    // scroll parallax
   
    func setupViews() {
        scrollview.contentInsetAdjustmentBehavior = .never
        
    }
    
 
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // selected locations
     
        if self.choosenlatitude != "" && self.choosenlongitude != "" {
            
            let location = CLLocationCoordinate2D(latitude: Double(self.choosenlatitude)!, longitude: Double(self.choosenlongitude)!)
            
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            
            let region = MKCoordinateRegion(center: location, span: span)
            
            self.mapview.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = self.titleArray.last!
            annotation.subtitle = self.priceArray.last!
            
            self.mapview.addAnnotation(annotation)
      
        }
      

        
        
    }
    
  
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            
            return nil
            
        }
        
        let reuseID = "Pin"
        
        var pinview = mapview.dequeueReusableAnnotationView(withIdentifier: reuseID)
        
        
        
        if pinview == nil {
            
            pinview = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinview?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
           
            
            pinview?.rightCalloutAccessoryView = button
            
        }else {
            
            pinview?.annotation = annotation
            
            
        }
        
        
        
        return pinview
        
        
    }
    
    
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.choosenlatitude != "" && self.choosenlongitude !=  "" {
            self.requestCLLocation = CLLocation(latitude: Double(self.choosenlatitude)!, longitude: Double(self.choosenlongitude)!)
            
            CLGeocoder().reverseGeocodeLocation(requestCLLocation) { (placemarks, error) in
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        
                        let mkplacemark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkplacemark)
                        mapItem.name = self.titleArray.last!
                      
         
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        mapItem.openInMaps(launchOptions: launchOptions)
                        
                        
                    }
                    
                }
            }
            
            
        }
        
        
        
    }
    
 
    
    
  // home and house data code
    


    @objc func getdata()  {
        
        
        
        let query = PFQuery(className: "Detail")
        query.whereKey("titlename", equalTo: self.selectedplace)
        query.findObjectsInBackground { (objects, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                
                //birinci bölüm
                
                self.titleArray.removeAll(keepingCapacity: false)
                self.bigdesArray.removeAll(keepingCapacity: false)
                self.imageArray.removeAll(keepingCapacity: false)
                self.priceArray.removeAll(keepingCapacity: false)
                self.smallArray.removeAll(keepingCapacity: false)
                self.nearby1Array.removeAll(keepingCapacity: false)
                self.nearby2Array.removeAll(keepingCapacity: false)
                self.trans1Array.removeAll(keepingCapacity: false)
                self.trans2Array.removeAll(keepingCapacity: false)
                self.latitudearray.removeAll(keepingCapacity: false)
                self.longitudearray.removeAll(keepingCapacity: false)
             
                
                
          
                // eklenenler
                
                self.imgiconArray1.removeAll(keepingCapacity: false)
                self.imgiconArray2.removeAll(keepingCapacity: false)
                self.imgiconArray3.removeAll(keepingCapacity: false)
                self.imgiconArray4.removeAll(keepingCapacity: false)
                self.imgiconArray5.removeAll(keepingCapacity: false)
                self.imgiconArray6.removeAll(keepingCapacity: false)
                self.imgiconArray7.removeAll(keepingCapacity: false)
                self.imgiconArray8.removeAll(keepingCapacity: false)
                
                
                self.labelicon1Array.removeAll(keepingCapacity: false)
                self.labelicon2Array.removeAll(keepingCapacity: false)
                self.labelicon3Array.removeAll(keepingCapacity: false)
                
                self.citysarray.removeAll(keepingCapacity: false)
                
                self.roomarray.removeAll(keepingCapacity: false)
                self.bedroomarray.removeAll(keepingCapacity: false)
                self.bathroomarray.removeAll(keepingCapacity: false)
                self.sizearray.removeAll(keepingCapacity: false)
                self.heatingarray.removeAll(keepingCapacity: false)
                
                 self.agencydesarray.removeAll(keepingCapacity: false)
                 self.agencyimgarray.removeAll(keepingCapacity: false)
                

                
                
                for object in objects!  {
                    
                    // ikinci bölüm
                    
                    
                    self.titleArray.append(object.object(forKey: "titlename")as! String)
                    self.priceArray.append(object.object(forKey: "pricename")as! String)
                    self.smallArray.append(object.object(forKey: "smalldes")as! String)
                    self.bigdesArray.append(object.object(forKey: "bigdes")as! String)
                    self.nearby1Array.append(object.object(forKey: "nearby1")as! String)
                    self.nearby2Array.append(object.object(forKey: "nearby2")as! String)
                    self.trans1Array.append(object.object(forKey: "trans1")as! String)
                    self.trans2Array.append(object.object(forKey: "trans2")as! String)
                    self.imageArray.append(object.object(forKey: "image")as! PFFile)
                    
                    
                    
                    // eklenenler
                  
                    self.imgiconArray1.append(object.object(forKey: "icon1")as! PFFile)
                    self.imgiconArray2.append(object.object(forKey: "icon2")as! PFFile)
                    self.imgiconArray3.append(object.object(forKey: "icon3")as! PFFile)
                    
                    self.imgiconArray4.append(object.object(forKey: "icon4")as! PFFile)
                    self.imgiconArray5.append(object.object(forKey: "icon5")as! PFFile)
                    self.imgiconArray6.append(object.object(forKey: "icon6")as! PFFile)
                    self.imgiconArray7.append(object.object(forKey: "icon7")as! PFFile)
                    self.imgiconArray8.append(object.object(forKey: "icon8")as! PFFile)
                    
                    
                    self.labelicon1Array.append(object.object(forKey: "labelicon1")as! String)
                    self.labelicon2Array.append(object.object(forKey: "labelicon2")as! String)
                    self.labelicon3Array.append(object.object(forKey: "labelicon3")as! String)
                    
                    self.latitudearray.append(object.object(forKey:   "latitude")as! String)
                    self.longitudearray.append(object.object(forKey: "longitude")as! String)
                    
                    self.citysarray.append(object.object(forKey: "city") as! String)
                    
                    self.roomarray.append(object.object(forKey: "room")as! String)
                    self.bedroomarray.append(object.object(forKey: "bedroom")as! String)
                    self.bathroomarray.append(object.object(forKey: "bathroom")as! String)
                    self.sizearray.append(object.object(forKey: "size")as! String)
                    self.heatingarray.append(object.object(forKey: "heating")as! String)
                    
                    self.agencydesarray.append(object.object(forKey: "agencydes")as! String)
                    self.agencyimgarray.append(object.object(forKey: "agencyimg")as! PFFile)
                    
                
                    
                 
                    //üçüncü bölüm
                 
                    
                      self.titlename.text = "  \(self.titleArray.last!)"
                      self.pricename.text = " \(self.priceArray.last!)"
                      self.smalldes.text = " \(self.smallArray.last!)"
                      self.bigdes.text = " \(self.bigdesArray.last!)"
                      self.nearby1.text = " \(self.nearby1Array.last!)"
                      self.nearby2.text = " \(self.nearby2Array.last!)"
                      self.trans1.text = " \(self.trans1Array.last!)"
                      self.trans2.text = " \(self.trans2Array.last!)"
                  
                     // eklenen textler !!
                    
                    self.labelicon1.text = " \(self.labelicon1Array.last!)"
                    self.labelicon2.text = " \(self.labelicon2Array.last!)"
                    self.labelicon3.text = " \(self.labelicon3Array.last!)"
                    
                    self.choosenlatitude = self.latitudearray.last!
                    self.choosenlongitude =  self.longitudearray.last!
                    
                    
                    
                    // others
                    
                    self.citys.text = " \(self.citysarray.last!)"
                    
                // new code
                    
                    self.rooms.text = " \(self.roomarray.last!)"
                    self.bedrooms.text = " \(self.bedroomarray.last!)"
                    self.bathroom.text = " \(self.bathroomarray.last!)"
                    self.size.text = " \(self.sizearray.last!)"
                    self.heating.text = " \(self.heatingarray.last!)"
                    
                     self.agencydes.text = " \(self.agencydesarray.last!)"
                    
                
                   
                    
                 
                    
                    // location updating code refresh...
                    
                    self.manager.startUpdatingLocation()
                    
                    
                    // eklenen imageviewler
                    
                    self.agencyimgarray.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.agencyimg.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
             
                    
                    
                    self.imgiconArray1.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon1.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    
                    
                    self.imgiconArray2.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon2.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    
                    self.imgiconArray3.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon3.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    
                    self.imgiconArray4.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon4.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    
                    self.imgiconArray5.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon5.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    self.imgiconArray6.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon6.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    self.imgiconArray7.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon7.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    self.imgiconArray8.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imgicon8.image = UIImage(data: data!)
                            
                            
                        }
                        
                    })
                    
                    
                    
                    
                    self.imageArray.last!.getDataInBackground(block: { (data, error) in
                        
                        if error != nil {
                            
                            let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okbutton)
                            
                            self.present(alert, animated: true, completion: nil)
                        }else {
                            self.imageview.image = UIImage(data: data!)
                            
                            
                        }
                        
                        
                    })
                   
                   
                    
                    
                    
                }
                
            }
        }
        
      
        
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func shareclicked(_ sender: Any) {
        
         SVProgressHUD.show(withStatus: "Shared")
     
        let activitycontroller = UIActivityViewController(activityItems: [self.titlename.text!, self.pricename.text!,self.smalldes.text!,self.imageview.image!], applicationActivities: nil)
        
        
        
        activitycontroller.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("Completed")
            } else {
                print("Canceled")
            }
        }
        present(activitycontroller, animated: true) {
            print("Presented")
        }
 
           SVProgressHUD.dismiss(withDelay: 1)
    }
    
    
    @IBAction func sharePDFTapped(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "img", withExtension: "pdf") else { return }
        let controller = UIDocumentInteractionController(url: url)
        controller.delegate = self as? UIDocumentInteractionControllerDelegate
        controller.presentPreview(animated: true)
    }
    
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    
    

    
    @IBAction func contact(_ sender: Any) {
        
        
  
    }
    
  
    
    
    
    
    @IBAction func readallbutton(_ sender: Any) {
  
        
        // read all segue code
        
        
        
          self.selectedall = self.selectedplace// read all için selectedplace kullnaılmış önemli detay !
     
          self.performSegue(withIdentifier: "fromdes", sender: nil)
        
        }
        
    
        


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fromdes"  {
            let destinationVC = segue.destination as! ReadmoreViewController
            destinationVC.selectedread = self.selectedall
            
            // read all segue code
            
            
        }else if  segue.identifier == "getimage" {
            let destinationVC = segue.destination as! SlideViewController
            destinationVC.selectedslayt = self.selectedimg
            
        }
 
   }
   
    
    
   
    
 
    
    @IBAction func contactclicked(_ sender: Any) {
        
 
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectiontitlearray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailViewCell
        
        
        
        cell.labelcollection.text = collectiontitlearray[indexPath.row]
        
        collectionimagearray[indexPath.row].getDataInBackground { (data, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                cell.imgview.image = UIImage(data: data!)
                
                
            }
        }
        
        // new version code 1.1.1 !
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 6.0
        
        
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        self.selected = collectiontitlearray[indexPath.row]
      
        SVProgressHUD.show(withStatus: "")
     
        self.detailselected = collectiontitlearray[indexPath.row]
         //self.performSegue(withIdentifier: "fromdetail1", sender: nil)
       
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailVC") as? DetailViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        vc?.selectedplace=self.selected
        
        
          SVProgressHUD.dismiss(withDelay: 0.5)
        
    }
    
    
    @IBAction func cancelbuttonfornav(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func getimage(_ sender: Any) {
        
        self.selectedimg = self.selectedplace
        
        self.performSegue(withIdentifier: "getimage", sender: nil)
        
        
        
        
    }
    
    
    
    
    
    ////
    
    
    
    
    // collection view data'sı
    
    @objc func getdatacollection() {
        
        let query = PFQuery(className: "Detail")
        query.whereKey("smilar", equalTo: "data")
        query.order(byAscending: "pricevalue")
      
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                self.collectiontitlearray.removeAll(keepingCapacity: false)
                self.collectionimagearray.removeAll(keepingCapacity: false)
                
                
                for object in objects! {
                    
                    self.collectiontitlearray.append(object.object(forKey: "titlename")as! String)
                    self.collectionimagearray.append(object.object(forKey: "image")as! PFFile)
                    
                    
                    
                    
                    
                }
            }
            
            self.collectionview.reloadData()
            
        }
        
    }
    
    
}
  

