//
//  SenteceTableViewCell.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit

class SenteceTableViewCell: UITableViewCell {
  
  
  @IBOutlet private weak var sentenseTitleLabel: UILabel!
  
  var viewModel: SentenceModel? {
    didSet {
      if let validModel = viewModel {
        setupUI(validModel)
      }
    }
  }
  
  private func setupUI(_ model: SentenceModel) {
    sentenseTitleLabel.text = model.sentenceText
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    if selected {
      setSelected(false, animated: true)
    }
  }
  
}
