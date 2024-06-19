//
//  LoggageTests.swift
//  LoggageTests
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import XCTest
import Foundation

@testable import Loggage

class LoggageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Loggage.isDebugInformationEnabled = true
        Loggage.isLineBreakEnabled = true
        Loggage.areEmojisEnabled = true
        Loggage.isTimestampEnabled = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLog() {
        Loggage.verbose("Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie! Verbosie!")
        Loggage.debug("Looks like we are looking for some unexpected behaviour.")
        Loggage.info("Just want to inform you about something. Maybe it is something important?")
        Loggage.todo("Remember to do something about this... Or maybe you should do it now?")
        Loggage.warning("Woops! This is potentially not good, are we sure about this?")
        Loggage.error("Houston, we've had a problem. This is not right 🚀")
        
        XCTAssert(true, "Let's just assume that Apple's 'print' function works for now 😅")
    }
    
    func testConsoleLogMessageFormat() {
        let consoleString: String = self.constructTestConsoleString()
        XCTAssert(consoleString == "\n🔊 can.swift:1337 - myFunction(): My message")
    }
    
    func testDebugInformation() {
        var consoleString: String = self.constructTestConsoleString()
        XCTAssert(consoleString == "\n🔊 can.swift:1337 - myFunction(): My message")
        
        Loggage.isDebugInformationEnabled = false
        consoleString = self.constructTestConsoleString()
        XCTAssert(consoleString == "\n🔊 : My message")
    }
    
    func testLineBreak() {
        var consoleString: String = self.constructTestConsoleString()
        XCTAssert(consoleString == "\n🔊 can.swift:1337 - myFunction(): My message")
        
        Loggage.isLineBreakEnabled = false
        consoleString = self.constructTestConsoleString()
        XCTAssert(consoleString == "🔊 can.swift:1337 - myFunction(): My message")
    }
    
    func testEmojis() {
        var consoleString: String = self.constructTestConsoleString()
        XCTAssert(consoleString == "\n🔊 can.swift:1337 - myFunction(): My message")
        
        Loggage.areEmojisEnabled = false
        consoleString = self.constructTestConsoleString()
        XCTAssert(consoleString == "\nVERBOSE can.swift:1337 - myFunction(): My message")
    }
    
    private func constructTestConsoleString() -> String {
        return Loggage.constructConsoleString(message: "My message", logLevel: .verbose, file: "file/path/because/i/can.swift", function: "myFunction()", line: 1337)
    }
}
