//
//  WKwebViewController.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 04/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit
import WebKit

class WKwebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
         webConfiguration.allowsInlineMediaPlayback = true
         webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        let request: URLRequest = URLRequest(url: URL(string: url!)!)
        self.webView.load(request)
    }

}
