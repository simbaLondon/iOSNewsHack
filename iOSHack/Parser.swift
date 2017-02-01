//
//  Parser.swift
//  iOSHack
//
//  Created by Simone Barbara on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation
class Parser{
  
  func getJSONData(data:Data) -> [String:AnyObject]? {
    
    do {
      let json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions()) as? [String: AnyObject]
      
      print(json)
      
      return json
      
    }
    catch {
      
      return nil
    }
  }
  
  func formatData(jsonData: [String:AnyObject]) -> [String:AnyObject] {
  
    /*
     * The formatDataDictionary, at the moment, contains:
     *
     * "sentence" : <the sentence sent to google api>
     * "Entities" : which is an array of entities (dictionaries) returned by the google api
     *  every dictionary is in the following format:
     *  "name" : <name of the entity>
     *  "wikipedia" : <link to the wikipedia page of the entity>
     *
     */
    
    
    var formatDataDictionary = [String:AnyObject]()
    
    //  sentences is an array containing a single dictionary
    // with two entries: "sentences" and "text"
    
    let sentences = ((jsonData["sentences"] as! [AnyObject])[0]) as! [String:AnyObject]
    let sentence = (sentences["text"] as! [String:AnyObject])["content"] as! String
    
    // add the sentence in the dictionary
    formatDataDictionary["sentence"] = sentence as AnyObject
    
    var tempArray = [[String:String]]()
    
    //print(jsonData["entities"]?.count)
    
    for entityN in jsonData["entities"] as! [AnyObject] {
      
      
      // create the entity dictionary
      let name = entityN["name"]!!
      let wikipedia = ((entityN["metadata"] as! [String:AnyObject])["wikipedia_url"] as? String)
      
      let tempDict = ["name":name,"wikipedia":wikipedia ?? ""]
      tempArray.append(tempDict as! [String : String])
      
    }
    
    formatDataDictionary["Entities"] = tempArray as AnyObject?
      return formatDataDictionary
    
  }
}
