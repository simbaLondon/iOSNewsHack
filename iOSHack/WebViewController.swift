//
//  WebViewController.swift
//  iOSHack
//
//  Created by Hristo Uzunov  on 31/01/2017.
//  Copyright © 2017 Simone Barbara. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
  @IBOutlet private weak var baseView: UIView!
  
  private var webView: WKWebView!
  var spinner: UIActivityIndicatorView!
  var link = "" {
    didSet {
      if nil != webView {
        loadLink()
      }
    }
  }
  
  private func loadLink() {
    if webView.isLoading {
      webView.stopLoading()
      if nil != spinner {
        spinner.stopAnimating()
      }
    }
    let myURL = URL(string: link)
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
    
    prepareSpinner()
  }
  
  private func prepareSpinner() {
    spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    spinner.center = view.center
    spinner.hidesWhenStopped = true
    
    spinner.startAnimating()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: baseView.bounds, configuration: webConfiguration)
    webView.uiDelegate = self
    webView.navigationDelegate = self
    baseView.addSubview(webView)
    
    /*view.addSubview(webView)
    
    let views = ["webview": webView]
    
    let horisontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[webview]-|", options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: views)
    
    let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[webview]-|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: views)
    
    NSLayoutConstraint.activate(horisontalConstraints)
    NSLayoutConstraint.activate(verticalConstraints)*/
    
    loadLink()
  }
  
}

extension WebViewController: WKUIDelegate {
  
}

extension WebViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    spinner.stopAnimating()
  }
}
