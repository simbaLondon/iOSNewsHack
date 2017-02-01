//
//  AppDelegate.swift
//  iOSHack
//
//  Created by Simone Barbara on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var firebaseData: FirebaseData!
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    FIRApp.configure()
    self.firebaseData = FirebaseData()
    
    let splitViewController = self.window!.rootViewController as! UISplitViewController
    let leftNavController = splitViewController.viewControllers.first as! UINavigationController
    let masterViewController = leftNavController.topViewController as! SentencesTableViewController
    let detailViewControllerNavigation = splitViewController.viewControllers.last as! UINavigationController
    let detailViewController = detailViewControllerNavigation.viewControllers.first as! SearchResultsViewController
    
    
    masterViewController.sentensesDelegate = detailViewController
    
   // self.getData()
    
    return true
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
    self.firebaseData.databaseConnect()
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
 /* func getData(){
    
    //let conn = NetworkManager()
    //let parser = Parser()
    let url_to_gnl = "https://language.googleapis.com/v1/documents:annotateText?fields=entities%2Csentences&key=AIzaSyAyQvf3giU4IT9LNZTzKaogZJ8A-4ClhHI"
    
    DispatchQueue.global(qos: .userInitiated).async {
      
      let sentence = "Donald Trump released an interview yesterday to The Telegraph"
      
      let gnlOptionDictionary = GNLOptions()
      
      gnlOptionDictionary.content = sentence
      gnlOptionDictionary.type = "PLAIN_TEXT"
      
      let dictionary = gnlOptionDictionary.formatOptionDictionary()
      
      
      
      NetworkManager.getRawData(url: url_to_gnl, sentence:sentence, optionsDictionary: dictionary, completion: {
        (success, data) -> Void in
        
        if data != nil{
          
          let jsonData = Parser.getJSONData(data: data!)!
          
          print(jsonData)
          
          let formattedJson = Parser.formatData(jsonData: jsonData)
          
          for entity in formattedJson["Entities"] as! [AnyObject]{
            
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print(entity)
            
            
          }
          
          DispatchQueue.main.async {
            
            // put your UI interacting code here
          }
          
        }else{
          
          print("Error")
          DispatchQueue.main.async {
            // display your error here
            
          }
          
        }
        
      })
      
    }
    
  }
  */
}

