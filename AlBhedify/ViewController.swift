//
//  ViewController.swift
//  AlBhedify
//
//  Created by Marcus Ekelund on 2016-03-02.
//  Copyright © 2016 Marcus Ekelund. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var toolBar: UIToolbar!
    
    private var currentLanguage: Language = .English
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        content.delegate = self
        restoreValues()
        setupKeyboardObservers()
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
        
        storeValues()
    }
    
    @IBAction func shareClicked(sender: AnyObject) {
        let objectsToShare = [content.text]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        let shareView = sender.view as UIView!
        activityVC.popoverPresentationController?.sourceView = shareView
        activityVC.popoverPresentationController?.sourceRect = shareView.bounds
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    private func setupKeyboardObservers() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidHide:"), name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y = -keyboardSize.height
        }
    }

    func keyboardDidHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        storeValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func storeValues() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(currentLanguage.rawValue, forKey: "currentLanguage")
        defaults.setValue(content.text, forKey: "content")
    }
    
    private func restoreValues() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let storedLanguageId = defaults.integerForKey("currentLanguage")
        if let storedLanguage = Language(rawValue: storedLanguageId) {
            switchLanguage(storedLanguage)
        }
        else {
            switchLanguage(.English)
        }
        
        if let storedContent = defaults.stringForKey("content") {
            content.text = storedContent
        }
    }
    
    private func switchLanguage(newLanguage: Language) {
        let transition = CATransition()
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.duration = 0.25
        language.layer.addAnimation(transition, forKey: kCATransitionPush)

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

