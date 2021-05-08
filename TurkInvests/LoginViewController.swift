//
//  LoginViewController.swift
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
import LocalAuthentication
import SVProgressHUD





class LoginViewController: UIViewController, UITextFieldDelegate,UIApplicationDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
       
        
        
        usernametext.layer.cornerRadius = 6.0
        passwordtext.layer.cornerRadius = 6.0
        loginbutton.layer.cornerRadius = 6.0
        loginbutton.layer.shadowRadius = 6.0
        loginbutton.layer.shadowOpacity = 1.0
        
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Are you really.. ?", reply: { (success, error) in
                if success  == true {
                    print("success")
                    
                self.performSegue(withIdentifier: "tabbar", sender: nil)
                    
                    
                    
                }else {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
            })
            
            
        }
        

        // Do any additional setup after loading the view.
        
        
        
        let loginButton: FBSDKLoginButton = {
            let loginButton = FBSDKLoginButton()
            loginButton.readPermissions = ["public_profile","email"]
            loginButton.delegate = self
            self.view.addSubview(loginButton)
            
            return loginButton
            
        } ()
        
        self.view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 85, y: 450 , width: view.frame.width - 170 , height: 30)
        loginButton.delegate = self
        
        if FBSDKAccessToken.current() != nil {
            
            
            print("user is not logged in")
            
            
            
        }else {
            
            print("user isFBSDKAccessTokenlogged in")
            
            
            
            
        }
        
        
        
        
        
        
        usernametext.delegate = self
        passwordtext.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernametext.resignFirstResponder()
        passwordtext.resignFirstResponder()
        
        
        return true
    }

    
    

    
    @IBAction func loginclicked(_ sender: Any) {
        
    
        
     
         SVProgressHUD.show(withStatus: "Login")
        
        if usernametext.text != ""  && passwordtext.text != "" {
            
            
            PFUser.logInWithUsername(inBackground: usernametext.text!, password: passwordtext.text!) { (user, error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okbutton)
                    
                    self.present(alert, animated: true, completion: nil)
                    SVProgressHUD.dismiss(withDelay: 1)
                    
                    
                }else {
                    
                    print("success")
                    
                    
                    
                    UserDefaults.standard.set(self.usernametext.text!, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberUser()
                    
                    
                    
                    
                    
                }
                
            }
            
            
        }else  {
            let alert = UIAlertController(title: "error", message: "User Name And Password Required", preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okbutton)
            
            self.present(alert, animated: true, completion: nil)
            SVProgressHUD.dismiss(withDelay: 1)
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
        
        
        
        
        print("user is logged out")
        
    }
        
    
    
   
    
    
    
}
    

