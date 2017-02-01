//
//  NetworkManager.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation

class NetworkManager {
  
  func getRawData(url:String, completion: @escaping (Bool, Data?) -> Void ) {
    
    let urld = URL(string: url)!
    
   // to do: remove hardcoded text
    let dictionary = [
      
      "document":
        
        ["type": "PLAIN_TEXT",
         
         "content": "I'm going to visit London, the capital of China"],
      
      "features":
        
        ["extractEntities": true,
         
         "extractDocumentSentiment": true,
         
         "extractSyntax": true]] as [String : Any]
    
    
    let requestData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
    
    
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
