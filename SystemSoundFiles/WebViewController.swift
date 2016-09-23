//
//  WebViewController.swift
//  SystemSoundFiles
//
//  Created by Tadashi on 2016/09/23.
//  Copyright © 2016 T@d. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

	var webView : UIWebView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

		self.webView = UIWebView()
		self.webView?.delegate = self
		self.webView?.frame = self.view.bounds
		self.view.addSubview(self.webView!)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        let url = NSURL(string : "https://icons8.com/")
        let urlRequest = NSURLRequest(url: url! as URL)
        self.webView?.loadRequest(urlRequest as URLRequest)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
