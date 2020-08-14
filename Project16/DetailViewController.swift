//
//  DetailViewController.swift
//  Project16
//
//  Created by Subhrajyoti Chakraborty on 14/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var urlData: URLRequest?

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        view = webView
        
        webView.load(urlData!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
