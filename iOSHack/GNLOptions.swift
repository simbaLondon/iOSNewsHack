//
//  GNLOptions.swift
//  iOSHack
//
//  Created by Simone Barbara on 01/02/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

// Google Natural language Options Dictionary

import Foundation

class GNLOptions {
  
  // properties
  
  //  document
  var content = ""
  var getContentUri = ""
  var language = ""
  var type = ""
  
  // encodingType
  var encodingType = ""
  
  // features
  var extractDocumentSentiment = true
  var extractEntities = true
  var extractSyntax = true
  
  func formatOptionDictionary() -> [String:Any] {
    
    let document = [
                    "type":type,
                    "content":content,
                    //"getContentUri":getContentUri,
                    //"language":language,
                  ]
    let features = [
                    "extractDocumentSentiment":extractDocumentSentiment,
                    "extractEntities":extractEntities,
                    "extractSyntax":extractSyntax
                  ]
    
    
    let options = ["document": document,
                   //"encodingType":encodingType,
                   "features": features
                  ] as [String : Any]
    
    
    return options
  }
  
  
  
  
  
  
  
  
}
