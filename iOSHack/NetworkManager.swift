//
//  NetworkManager.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation

class NetworkManager {
  
  static func getRawData(url:String, sentence: String?, optionsDictionary:[String:Any], completion: @escaping (Bool, Data?) -> Void ) {
    
    let urld = URL(string: url)!
    let requestData = try? JSONSerialization.data(withJSONObject: optionsDictionary, options: .prettyPrinted)
    
    
    var request = URLRequest(url: urld)
    
    request.httpMethod = "POST"
    
    request.httpBody = requestData
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      
      completion(true, data)
    }
    
    task.resume()
  }
  
  
}
