//
//  OthersViewController.swift
//  TurkInvests
//
//  Created by Emre on 4.10.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit

class OthersViewController: UIViewController {
    
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchviews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            firstview.alpha = 1
            secondview.alpha = 0
        }else {
            
            firstview.alpha = 0
            secondview.alpha = 1
            
            
            
        }
    
        
    }
    
   
    

    
}
