//
//  AlBhedTranslator.swift
//  AlBhedify
//
//  Created by Marcus Ekelund on 2016-03-02.
//  Copyright © 2016 Marcus Ekelund. All rights reserved.
//

import Foundation

public class AlBhedTranslator {
    private class var englishAlphabet: String {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    private class var alBhedAlphabet: String {
        return "ypltavkrezgmshubxncdijfqowYPLTAVKREZGMSHUBXNCDIJFQOW"
    }
    
    class func toAlBhed(english: String) -> String {
        return translate(english, fromAlphabet: englishAlphabet, toAlphabet: alBhedAlphabet)
    }
    
    class func toEnglish(alBhed: String) -> String {
        return translate(alBhed, fromAlphabet: alBhedAlphabet, toAlphabet: englishAlphabet)
    }
    
    private class func translate(text: String, fromAlphabet: String, toAlphabet: String) -> String {
        var result = ""
        
        for c in text.characters {
            var nc: Character
            if let fromIndex = fromAlphabet.characters.indexOf(c) {
                nc = toAlphabet[fromIndex]
            }
            else {
                nc = c
            }
            
            result = result + String(nc)
        }
        
        return result
    }
}