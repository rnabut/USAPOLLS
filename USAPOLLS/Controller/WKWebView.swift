//
//  WKWebView.swift
//  USAPOLLS
//
//  Created by Reidel Nabut on 6/30/20.
//  Copyright © 2020 USAPOLLS.NEWS. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

var webView: WKWebView!

override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
}
override func viewDidLoad() {
    super.viewDidLoad()
    
    let myURL = URL(string:"https://www.usapolls.news")
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
}}
