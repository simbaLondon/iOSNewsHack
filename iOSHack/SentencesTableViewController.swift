//
//  SentencesTableViewController.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit

protocol SentensesProtocol {
  func sentenceSelected(results: [ResultModel])
}

class SentencesTableViewController: UITableViewController {
  
  var sentences = [SentenceModel]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  var sentensesDelegate: SentensesProtocol?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let nib = UINib(nibName: "SenteceTableViewCell", bundle: Bundle.main)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UITableViewCell
    let height = view.frame.size.height
    
    tableView.rowHeight = height
    
    tableView.register(nib, forCellReuseIdentifier: "sentenceCell")
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return sentences.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "sentenceCell") as! SenteceTableViewCell
    
    cell.viewModel = sentences[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    sentensesDelegate?.sentenceSelected(results: sentences[indexPath.row].resultModels)
  }
  
}

extension SentencesTableViewController: FirebaseDataProtocol {
  func newSentenceIn(sentence: SentenceModel) {
    self.sentences.append(sentence)
  }
}
