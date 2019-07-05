//
//  FirstViewController.swift
//  tabapp
//
//  Created by Olzhas Akhmetov on 7/3/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit
import WebKit

class FirstViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://google.com")
        
        let urlrequest = URLRequest(url: url!)
        
        webview.load(urlrequest)
    }


}

