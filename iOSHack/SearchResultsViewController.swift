//
//  SearchResultsViewController.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
  
  @IBOutlet private weak var collectionView: UICollectionView!
  
  var searchResults = [ResultModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension SearchResultsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searchResults.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = UICollectionViewCell()
    
    return cell
  }
}

extension SearchResultsViewController: UICollectionViewDelegate {
  
}
