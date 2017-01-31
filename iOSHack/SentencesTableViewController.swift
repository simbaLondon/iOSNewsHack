//
//  SentencesTableViewController.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit

class SentencesTableViewController: UITableViewController {
  
  var sentences = [SentenceModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "SenteceTableViewCell", bundle: Bundle.main)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UITableViewCell
    let height = view.frame.size.height
    
    tableView.rowHeight = height
    
    tableView.register(nib, forCellReuseIdentifier: "sentenceCell")
    
    //TODO: fetch the senteces from the service
    
    for item in 0 ..< 5 {
      var resultModels = [ResultModel]()
      for result in 0 ..< 5 {
        let resultModel = ResultModel(modelURL: "model url \(result)", modelTitle: "title for model \(result)", modelSignificance: Double(result) + 2.5, type: SearchResultType.text)
        resultModels.append(resultModel)
      }
      let sentcence = SentenceModel(sentenceText: "text type string for object \(item)", resultModels: resultModels)
      
      sentences.append(sentcence)
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
}
