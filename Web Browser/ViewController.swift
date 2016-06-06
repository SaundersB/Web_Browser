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
    
    var myProgressView: UIProgressView! = nil
    var myTimer: NSTimer!
    var theBool: Bool!
    
    @IBAction func load_website(sender: AnyObject) {
        var text = ""
        
        if(self.address_field.text != ""){
            // Verify that the address has the necessary http://
            if (self.address_field.text!.containsString("http://") || self.address_field.text!.containsString("https://")) {
                text = self.address_field.text!
            }
            else {
                print("Missing http://. Adding it now.")
                text = "http://"
            }
            // If a web address was not entered, we'll run it as a google search.
            if (!self.address_field.text!.containsString(".com")){
                print("Text is missing .com. Running as a Google search")
                let google_search_url = "www.google.com/#q="
                text = text + google_search_url + self.address_field.text!
                print("Sending URL: " + text)
            }
            else {
                print("Text does have .com")
                text = text + self.address_field.text!
            }
            
            let url = NSURL(string: text)
            let req = NSURLRequest(URL:url!)
            self.webView!.loadRequest(req)
            self.webView.scalesPageToFit = true
            self.webView.allowsInlineMediaPlayback = true
            self.webView.allowsPictureInPictureMediaPlayback = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultWebsite()
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
    
    @IBAction func loadHomePage(sender: AnyObject) {
        loadDefaultWebsite()
    }
    
    func loadDefaultWebsite() {
        let text = "http://news.ycombinator.com/"
        let url = NSURL(string: text)
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
        self.webView.scalesPageToFit = true
    }
    
}