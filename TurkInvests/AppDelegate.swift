//
//  AppDelegate.swift
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
import UserNotifications
import CoreData
import OneSignal



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        //push code!!  new
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        
        // ONE SİGNAL
        
        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "0939690d-4e91-4f54-94d2-cb2f351d1e4d",
                                        handleNotificationAction: nil,
                                        settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
        /// END ONE SİGNAL
        
        
        
        
        rememberUser()
        
      
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
       
        
        
        
        let configuration  = ParseClientConfiguration { (ParseMutableClientConfiguration) in
            
            ParseMutableClientConfiguration.applicationId = "332HqN3IbzxykF76xqOgWIcnoZhbZAZJmXwsDDqi"   
            ParseMutableClientConfiguration.clientKey = "fiqAozgBqx6aqyJAq6t5bifA0PpfDM9vH6en4nFH"
            ParseMutableClientConfiguration.server = "https://parseapi.back4app.com"
           
            
        }
        
        Parse.initialize(with: configuration)
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            
            FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
            
            
          //  others version add payment code !!
          //  STPPaymentConfiguration.shared().publishableKey = "pk_test_OFP0zw7VELEfwNrc4Xv8zgSb"
            
            
            
            return true
            
         
            
        }
        
        
        let defaultACL = PFACL()
        
        defaultACL.hasPublicReadAccess = true
        defaultACL.hasPublicWriteAccess = true
        
        PFACL.setDefault(defaultACL, withAccessForCurrentUser: true)
        
        
        
        return true
        
        
    }
    
    func saveInstallationObject(){
        if let installation = PFInstallation.current(){
            installation.saveInBackground {
                (success: Bool, error: Error?) in
                if (success) {
                    print("You have successfully connected your app to Back4App!")
                } else {
                    if let myError = error{
                        print(myError.localizedDescription)
                    }else{
                        print("Uknown error")
                    }
                }
            }
        }
    }
    
    
    
 

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBSDKAppEvents.activateApp()
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        return
            
            FBSDKApplicationDelegate.sharedInstance().application(application, open: url , sourceApplication: sourceApplication, annotation: annotation)
        
    }
    
    func rememberUser() {
            SVProgressHUD.show(withStatus: "")
        
        let user :String? = UserDefaults.standard.string(forKey: "user")
        
        if user != nil {
            
            let board : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let tabbar = board.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
            
            window?.rootViewController = tabbar
            
            
        }
        
        SVProgressHUD.dismiss(withDelay: 1.5)
        
    }
    
  
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
   
    
}
