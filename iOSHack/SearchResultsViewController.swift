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
  
  var searchResults = [ResultModel]() {
    didSet {
      collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(UINib(nibName: "SearchResultCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "searchResult")
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchResult", for: indexPath) as! SearchResultCollectionViewCell
    
    cell.viewModel = searchResults[indexPath.item]
    
    return cell
  }
}

extension SearchResultsViewController: UICollectionViewDelegate {
  
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.size.width, height: 120)
  }
}

extension SearchResultsViewController: SentensesProtocol {
  func sentenceSelected(results: [ResultModel]) {
    searchResults = results
  }
}
