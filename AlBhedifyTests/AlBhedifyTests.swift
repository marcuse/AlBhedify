//
//  AlBhedifyTests.swift
//  AlBhedifyTests
//
//  Created by Marcus Ekelund on 2016-03-02.
//  Copyright © 2016 Marcus Ekelund. All rights reserved.
//

import XCTest
@testable import AlBhedify

class AlBhedifyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnglishToAlBhed() {
        let text = "Greetings from the Gullwings!"
        let result = AlBhedTranslator.toAlBhed(text)
        XCTAssertEqual(result, "Knaadehkc vnus dra Kimmfehkc!")
    }

    func testAlBhedToEnglish() {
        let text = "Ouin sudran fyc y ryscdan yht ouin vydran csamd uv amtanpanneac!"
        let result = AlBhedTranslator.toEnglish(text)
        XCTAssertEqual(result, "Your mother was a hamster and your father smelt of elderberries!")
    }
    
    func testReversibleTranslation() {
        let text = "Space, the final frontier. These are the voyages of the Starship Enterprise."
        let result = AlBhedTranslator.toEnglish(AlBhedTranslator.toAlBhed(text))
        XCTAssertEqual(text, result)
    }
    
}
