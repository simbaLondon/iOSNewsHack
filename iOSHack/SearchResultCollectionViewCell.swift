//
//  SearchResultCollectionViewCell.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var searchResultLabel: UILabel!
  
  @IBOutlet private weak var linkLabel: UILabel!
  
  var viewModel: ResultModel? {
    didSet {
      if let validModel = viewModel {
        setupUI(validModel)
      }
    }
  }
  
  private func setupUI(_ model: ResultModel) {
    searchResultLabel.text = model.modelTitle
    let attributedLink = NSAttributedString(string: model.modelURL, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
    linkLabel.attributedText = attributedLink
  }
}
