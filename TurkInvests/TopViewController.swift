//
//  TopViewController.swift
//  TurkInvests
//
//  Created by Emre on 18.11.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//


import UIKit
import Parse
import SVProgressHUD


class TopViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    
    
    
    // variable
    
    
    var titlenameArray = [String]()
    var pricearray = [String]()
    
    
    
    
    // search selected code
    
    var selected = ""
    
    var searchresults = [String]()
    var searchresultsArray = [String]()
    var allArray = [DetailClass]()
    var allArraySearch = [DetailClass]()
    
    
    
    
    var filtertitlename = [String]()
    var issearching = false
    
    
    
    
    @IBOutlet weak var firstlabel: UILabel!
    
    
    
    
    
    
    
    
    // new code
    
    
    
    
    
    @IBOutlet weak var filteredbutton: UIButton!
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstlabel.isHidden = false
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self
        
        
        view.addSubview(tableview)
        
        tableview.isHidden = false
        
        getdata()
        
        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return issearching ?  self.allArraySearch.count : self.allArray.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopCell
        
        
        
        if(issearching) {
            cell.label.text = self.allArraySearch[indexPath.row].titlename
            cell.pricename.text  = self.allArraySearch[indexPath.row].pricename
        } else {
            cell.label.text = self.allArray[indexPath.row].titlename
            cell.pricename.text  = self.allArray[indexPath.row].pricename
        }
        
        
        return cell
        
        
    }
    
    
    
    // searchbar new code!! önemli
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        issearching=true
        
        
        firstlabel.isHidden = true
        
        tableview.isHidden = false
        
        SVProgressHUD.show(withStatus: "Searching Invest")
        
        searchbar.resignFirstResponder()
        
        let query = PFQuery(className: "Detail")
        
        
        
        query.findObjectsInBackground { (object, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                return
                
            }else {
                
                self.searchresults.removeAll(keepingCapacity: false)
                self.pricearray.removeAll(keepingCapacity: false)
                
                
                
                
                
                if object!.count > 0  {
                    
                    
                    for object in object! {
                        
                        let aDetailObj = DetailClass()
                        
                        aDetailObj.titlename = object.object(forKey: "titlename") as! String
                        aDetailObj.pricename = object.object(forKey: "pricename") as! String
                        self.allArray.append(aDetailObj)
                        
                        
                    }
                }
                
                
                self.tableview.reloadData()
                
                
            }
            
            
        }
        
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
    
    
    
    //other
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        searchbar.resignFirstResponder()
        searchbar.text = ""
        
        issearching = true
        tableview.reloadData()
        
        
        
        
        
        
    }
    
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        self.allArraySearch.removeAll()
        
        
        if searchText.isEmpty {
            
            issearching = false
            
            view.endEditing(true)
            
            tableview.reloadData()
        }
        else {
            
            issearching = true
            
            
            
            let filteredStrings = allArray.filter({(item: DetailClass) -> Bool in
                
                let mevcut:String = (item.titlename as? String)!
                let stringMatch = mevcut.lowercased().contains(searchText.lowercased())
                if(stringMatch) {
                    NSLog("# VAR: %@",searchText)
                    self.allArraySearch.append(item)
                    
                    return true
                } else {
                    return false
                }
                
            })
            
            NSLog("# ARRAY: %@",self.allArraySearch)
            tableview.reloadData()
            
        }
        
        
        
    }
    
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        searchbar.text = ""
        
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        searchbar.text = ""
        
    }
    
    
    
    
    
    
    // ilk kodlar
    
    
    
    func getdata()  {
        
        let query = PFQuery(className: "Detail")
        query.limit = 50;
        
        query.addDescendingOrder("createdAt")
        
        query.findObjectsInBackground { (objects, error) in
            
            
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okbutton)
                
                self.present(alert, animated: true, completion: nil)
                
                
            }else {
                
                
                
                if objects!.count > 0  {
                    
                    
                    for object in objects! {
                        
                        
                        // self.searchresults.append(object.object(forKey:  "titlename")as! String)  // sorun çözen kod blogu
                        let aDetailObj = DetailClass()
                        aDetailObj.titlename = object.object(forKey: "titlename") as! String
                        aDetailObj.pricename = object.object(forKey: "pricename") as! String
                        self.allArray.append(aDetailObj)
                        
                        
                    }
                }
                
                self.tableview.reloadData()
                NSLog("Gelenler:%@",self.allArray)
                
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        SVProgressHUD.show(withStatus: "")
        
        if (issearching) {
            
            
            self.selected = self.allArraySearch[indexPath.row].titlename
            
        }else {
            self.selected = self.allArray[indexPath.row].titlename
        }
        NSLog("clicked:%@",self.selected)
        self.performSegue(withIdentifier: "fromdetail", sender: nil)
        
        SVProgressHUD.dismiss(withDelay: 0.3)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromdetail"  {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedplace = self.selected
            
          
        }
        
    }
    
    
    
    
    // touch dismiss
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    
    
}

