//
//  Contact1ViewController.swift
//  TurkInvests
//
//  Created by Emre on 4.10.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit
import MessageUI
import Parse
import Foundation
import StoreKit
import SVProgressHUD



class Contact1ViewController: UIViewController, MFMailComposeViewControllerDelegate  {
    
   
    
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var messagefield: UITextField!
    @IBOutlet weak var Phonefield: UITextField!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var name: UIImageView!
    @IBOutlet weak var atmail: UIImageView!
    @IBOutlet weak var message: UIImageView!
    
    @IBOutlet weak var number: UIImageView!
    
    
    @IBOutlet weak var sendmail: UIButton!
    @IBOutlet weak var callphone: UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        sendmail.layer.cornerRadius = 6.0
        callphone.layer.cornerRadius = 6.0
        
        
        
    
        
        
         
        // Do any additional setup after loading the view.
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        namefield.resignFirstResponder()
        emailfield.resignFirstResponder()
        messagefield.resignFirstResponder()
        Phonefield.resignFirstResponder()
        
        
        
        
        return true
    }
    
    
    
    
    @IBAction func sendmessage(_ sender: Any) {
        
        SVProgressHUD.show(withStatus: "Sending..")
        
        if MFMailComposeViewController.canSendMail() {
            
            
            let mailcomposeVC =  MFMailComposeViewController()
            
            mailcomposeVC.setToRecipients(["info@turkinvests.com"])
            mailcomposeVC.setSubject("subject")
            mailcomposeVC.setMessageBody("name: \(namefield.text!) \n\nemail: \(emailfield.text!) \n\nmessage: \(messagefield.text!) \n\nPhone Number: \(Phonefield.text!)", isHTML: false)
            mailcomposeVC.setCcRecipients(["info@turkinvests.com"])
            mailcomposeVC.setBccRecipients(["info@turkinvests.com"])
            
            
            
            if let image = UIImage(named: "test"), let imageData = image.jpegData(compressionQuality: 1.0) { mailcomposeVC.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image.jpeg")
                
            }
            
            
            
            mailcomposeVC.mailComposeDelegate = self
            
            
            
            present(mailcomposeVC, animated: true,completion: nil)
            
            
            
            
        }
        
        SVProgressHUD.dismiss(withDelay: 0.5)
        
    }
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
        
    @IBAction func callphone(_ sender: Any){
        
        
    
        
        let url: NSURL = URL(string: "tel://+905350122559")! as NSURL
        UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        
        
        
       
        
    }
    
  
    
    
}
    


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
    
    
}
