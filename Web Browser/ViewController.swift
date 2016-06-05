//
//  ViewController.swift
//  Web Browser
//
//  Created by Brandon_Saunders on 6/5/16.
//  Copyright © 2016 Brandon Saunders. All rights reserved.
//
import WebKit
import UIKit


class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var navigation_bar: UINavigationBar!
    @IBOutlet weak var navigation_bar_button: UINavigationItem!
    @IBOutlet var back_button: NSObject!
    @IBOutlet weak var go_button: UIBarButtonItem!
    @IBOutlet weak var refresh_button: UIBarButtonItem!

    @IBOutlet weak var address_field: UITextField!
    
    @IBAction func load_website(sender: AnyObject) {
        //self.searchBar.text = "http://news.ycombinator.com/"
        //let text = self.address_field.text!
        let text = "http://news.ycombinator.com/"
        let url = NSURL(string: text)
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
        self.webView.scalesPageToFit = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.searchBar.delegate = self
    }
    
    @IBAction func backAction(sender: AnyObject) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardAction(sender: AnyObject) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        webView.stopLoading()
    }
}