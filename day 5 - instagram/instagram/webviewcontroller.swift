//
//  webviewcontroller.swift
//  instagram
//
//  Created by Olzhas Akhmetov on 2/21/18.
//  Copyright © 2018 Olzhas Akhmetov. All rights reserved.
//

import UIKit
import WebKit

class webviewcontroller: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webview.navigationDelegate = self
        
        let urlstr = "https://api.instagram.com/oauth/authorize/?client_id=ef2c58fade0b4a8b93e45e50f3ec36a2&redirect_uri=http%3A%2F%2Flocalhost%2F&response_type=token"
        let url = URL(string: urlstr)
        let urlrequest = URLRequest(url: url!)
        webview.load(urlrequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        let htmlString = "<br/><h2>Error!!!</h2><br><p>\(error.localizedDescription)</p>"
        webview.loadHTMLString(htmlString, baseURL: nil)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        let htmlString = "<br/><h2>Error!!!</h2><br><p>\(error.localizedDescription)</p>"
        webview.loadHTMLString(htmlString, baseURL: nil)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        print(navigationAction.request.url?.absoluteString)
        
        if (navigationAction.request.url?.absoluteString.hasPrefix("http://localhost/#access_token="))! {
            let token = navigationAction.request.url?.absoluteString.replacingOccurrences(of: "http://localhost/#access_token=", with: "")
            
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: "access_token")
            self.dismiss(animated: true, completion: nil)
        }
        
        decisionHandler(.allow)
    }
}
