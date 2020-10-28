//
//  ViewController.swift
//  proj5
//
//  Created by STARKS on 10/28/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKNavigationDelegate {
    
    var webView : WKWebView!
    var progressView : UIProgressView!
    let websites = ["apple.com","hackingwithswift.com"]
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action:#selector(webView.reload))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        let progressButton = UIBarButtonItem(customView:progressView)
        
        
         toolbarItems = [progressButton,spacer,refresh]
        
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        // Do any additional setup after loading the view.
    }
    @objc func openTapped()
    {
        let vc = UIAlertController(title: "Open page..", message: nil, preferredStyle: .actionSheet)
        
        for website in websites {
        vc.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
//        vc.addAction(UIAlertAction(title: "hackingwithswift", style: .default, handler: openPage))
        }
            vc.addAction(UIAlertAction(title: "cancel", style: .cancel))
        vc.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
    func openPage(action : UIAlertAction)
    {
        let url = URL(string: "https://"+action.title!)!
        webView.load(URLRequest(url:url))
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        if let host = url?.host{
            
            for website in websites {
                
                if host.contains(website)
                {
                    decisionHandler(.allow)
                    return
                }
            }
            
        }
        decisionHandler(.cancel)
    }
    
}

