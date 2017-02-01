//
//  FirebaseData.swift
//  iOSHack
//
//  Created by Michael Baldock on 01/02/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol FirebaseDataProtocol {
  func newSentenceIn(sentence: SentenceModel)
}

class FirebaseData {
  
  var ref: FIRDatabaseReference!
  
  var delegate: FirebaseDataProtocol?

  init() {
    ref = FIRDatabase.database().reference(withPath: "VoiceCaptures")
  }
  
  func databaseConnect () {
    
    self.ref.observe(FIRDataEventType.childAdded, with: { (snapshot) in
      let all = snapshot.valueInExportFormat() as! [String: AnyObject]
      let stringSentnce = all["text"] as! String
      
      let url = "https://language.googleapis.com/v1/documents:annotateText?fields=entities%2Csentences&key=AIzaSyAyQvf3giU4IT9LNZTzKaogZJ8A-4ClhHI"
      let sentence = stringSentnce
      let optionsDictionary = [
        "document":
          ["type": "PLAIN_TEXT",
           "content": stringSentnce],
        "features":
          ["extractEntities": true,
           "extractDocumentSentiment": true,
           "extractSyntax": true]] as [String : Any]
      
      NetworkManager.getRawData(url: url, sentence: sentence, optionsDictionary: optionsDictionary, completion: { (finished, data) in
        if let validData = data, let formattedDictionary = Parser.getJSONData(data: validData) {
          let formatted = Parser.formatData(jsonData: formattedDictionary)
          let finishedSentence = Parser.dictionaryToSentence(dictionary: formatted)
          self.delegate?.newSentenceIn(sentence: finishedSentence)
        }
      })
    })
  }
  
  
}
