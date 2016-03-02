//
//  ViewController.swift
//  AlBhedify
//
//  Created by Marcus Ekelund on 2016-03-02.
//  Copyright © 2016 Marcus Ekelund. All rights reserved.
//

import UIKit

enum Language {
    case English
    case AlBhed
}

class ViewController: UIViewController {

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var language: UILabel!
    
    private var currentLanguage: Language = .English
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        switchLanguage(.English)
    }

    @IBAction func translateClicked(sender: AnyObject) {
        let text = content.text
        let translatedText: String
        if currentLanguage == .English {
            translatedText = AlBhedTranslator.toAlBhed(text)
            switchLanguage(.AlBhed)
        }
        else {
            translatedText = AlBhedTranslator.toEnglish(text)
            switchLanguage(.English)
        }
        content.text = translatedText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func switchLanguage(newLanguage: Language) {
        currentLanguage = newLanguage
        if newLanguage == .English {
            language.text = "English"
            language.textColor = UIColor.purpleColor()
        }
        else {
            language.text = "Al Bhed"
            language.textColor = UIColor.redColor()
        }
    }
}

