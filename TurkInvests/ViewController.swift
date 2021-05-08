//
//  ViewController.swift
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





class ViewController: UIViewController, UITextFieldDelegate, UIApplicationDelegate, UIScrollViewDelegate {
    
 
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pageview: UIPageControl!
    @IBOutlet weak var loginbuttonlayout: UIButton!
    @IBOutlet weak var singupbuttonlayout: UIButton!
    
    
    var imgarray = [UIImage(named: "join1.png"),
                    UIImage(named: "join2.png"),
                    UIImage(named: "join3.png"),
                    UIImage(named: "join4.png"),
                    UIImage(named: "join5.png"),
   
                    ]
   
    
  
    
    
    var timer = Timer()
    var counter = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pageview.numberOfPages = imgarray.count
        pageview.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeimage), userInfo: nil, repeats: true)
            
        }
        
     
        
        
         loginbuttonlayout.layer.cornerRadius = 6.0
         singupbuttonlayout.layer.cornerRadius = 6.0
        
        
        
        // Do any additional setup after loading the view, typically from a nib.

        
        
    }
    
    
    @objc func changeimage()  {
        
        if counter < imgarray.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageview.currentPage = counter
            counter += 1
            
        }else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageview.currentPage = counter
            counter  = 1
        }
    }
    
    

    
    
    
    @IBAction func loginus(_ sender: Any) {
       
        self.performSegue(withIdentifier: "loginupone", sender: nil)
        
        
        
        
    }
    
    
    @IBAction func signup(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "signupone", sender: nil)
        
    }
    
    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let vc  = cell.viewWithTag(111) as? UIImageView {
            
            vc.image = imgarray[indexPath.row]
            
        }
        return cell
        
        
        
    }
    
 
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
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

