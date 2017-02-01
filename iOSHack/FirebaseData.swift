//
//  FirebaseData.swift
//  iOSHack
//
//  Created by Michael Baldock on 01/02/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation
import Firebase

class FirebaseData {
  
  var ref: FIRDatabaseReference!

  init() {
    ref = FIRDatabase.database().reference(withPath: "VoiceCaptures")
  }
  
  func databaseConnect () {
    
    print("trying to connect to Database...")
    self.ref.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
      
      print(snapshot)
      
    })
  }
  
  
}
