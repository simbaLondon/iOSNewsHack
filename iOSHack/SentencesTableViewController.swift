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
    
    //TODO: fetch the senteces from the service
    
    let url = "https://language.googleapis.com/v1/documents:annotateText?fields=entities%2Csentences&key=AIzaSyAyQvf3giU4IT9LNZTzKaogZJ8A-4ClhHI"
    let sentence = "There are a million refugees in your backyard right now"
    let optionsDictionary = [
      "document":
        ["type": "PLAIN_TEXT",
         "content": sentence],
      "features":
        ["extractEntities": true,
         "extractDocumentSentiment": true,
         "extractSyntax": true]] as [String : Any]
    
    NetworkManager.getRawData(url: url, sentence: sentence, optionsDictionary: optionsDictionary) { (finished, data) in
      if let validData = data, let formattedDictionary = Parser.getJSONData(data: validData) {
        let formatted = Parser.formatData(jsonData: formattedDictionary)
        let finishedSentence = Parser.dictionaryToSentence(dictionary: formatted)
        self.sentences.append(finishedSentence)
      }
      
      
    }
    
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
