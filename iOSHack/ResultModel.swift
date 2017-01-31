//
//  ResultModel.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import Foundation

enum SearchResultType {
  case link
  case text
  case socialMedia
}

struct ResultModel {
  let modelURL: String
  let modelTitle: String
  let modelSignificance: Double
  let type: SearchResultType
}
