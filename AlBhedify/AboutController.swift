//
//  AboutController.swift
//  AlBhedify
//
//  Created by Marcus Ekelund on 2016-03-07.
//  Copyright © 2016 Marcus Ekelund. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    @IBOutlet weak var AboutContent: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSBundle.mainBundle().URLForResource("about", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        AboutContent.loadRequest(request)
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
