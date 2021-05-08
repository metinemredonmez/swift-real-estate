//
//  SignupViewController.swift
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



class SignupViewController: UIViewController, UITextFieldDelegate,UIApplicationDelegate, UIImagePickerControllerDelegate, FBSDKLoginButtonDelegate {
   
    
    @IBOutlet weak var browselogin: UIButton!
    
    
    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var singupbutton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        browselogin.layer.cornerRadius = 6.0
        browselogin.layer.borderWidth = 1.0
        browselogin.layer.borderColor = UIColor.white.cgColor
        
        
        // kose çizgi degeleri ayarlama
        
        usernametext.layer.cornerRadius = 6
        passwordtext.layer.cornerRadius = 6
        singupbutton.layer.cornerRadius = 6.0
        
        
        // facebook login button ayarları
        
        
        let loginButton: FBSDKLoginButton = {
            let button = FBSDKLoginButton()
            button.readPermissions = ["public_profile","email"]
            
            
            return button
            
        } ()
        
        self.view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 85, y: 450 , width: view.frame.width - 170 , height: 30)
        loginButton.delegate = self
        
        if FBSDKAccessToken.current() != nil {
            
            
            print("User is not logged in")
            
            
            
        }else {
            
            print("User is logged in")
            
            
            
            
        }
        
        
       
        // Do any additional setup after loading the view.
        
        
        usernametext.delegate = self
        passwordtext.delegate = self
        
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernametext.resignFirstResponder()
        passwordtext.resignFirstResponder()
        
        
        return true
        
        
    }
    
    
    
     // valid email new ??
    
    func isemailvalidation(string: String) -> Bool {
        
        let emailregex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailtest = NSPredicate(format: "SELF MATCHES %@", emailregex)
        let result = emailtest.evaluate(with: string)
        return result
        
        
    }
    
    
    
  
    
    @IBAction func signupclicked(_ sender: Any) {
        
      
        
        
        if  usernametext.text != "" && passwordtext.text != "" && isemailvalidation(string: usernametext.text!)  {
            
             SVProgressHUD.show(withStatus: "Creating User")
           
            
            let user = PFUser()
      
            user.username = usernametext.text!
            user.password = passwordtext.text!
            user.signUpInBackground(block: { (success, error) in
                
                
                if error != nil {
                    
               
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                   
                    
                } else  {
                    
                   
                    
                    print("user created")
                    
                    UserDefaults.standard.set(self.usernametext.text!, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberUser()
                    SVProgressHUD.show(withStatus: "Singing in")
                    
                     SVProgressHUD.dismiss(withDelay: 2.5)
                    
                   
                    
                }
                
            })
            
            
        } else {
            
            
            let alert = UIAlertController(title: "error", message: "User Name And Password Required", preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okbutton)
            
            self.present(alert, animated: true, completion: nil)
            
           
        }
        
       
    }
    
    
    
    
    
    
    
       
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if ((error) != nil) {
            // Process error
            
            print(error?.localizedDescription as Any)
            return
        }
        else if result.isCancelled {
            // Handle cancellations
            
            
            
        }
        else {
            
            // navigate
            print("user is logged in")
            
            
            let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
            
            let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            delegate.window?.rootViewController = tabbar
            
            delegate.rememberUser()
            
            
            
            
        }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout")
        
        
    }
    
    
    
    @IBAction func browseloginaction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "browselogin", sender: nil)
        
        
        
        
    }
}


