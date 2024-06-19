//
//  LogLevelTests.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import XCTest
@testable import Loggage

class LogLevelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLevel() {
        XCTAssert(LogLevel.verbose.rawValue == 0)
        XCTAssert(LogLevel.debug.rawValue == 1)
        XCTAssert(LogLevel.info.rawValue == 2)
        XCTAssert(LogLevel.todo.rawValue == 3)
        XCTAssert(LogLevel.warning.rawValue == 4)
        XCTAssert(LogLevel.error.rawValue == 5)
    }
    
    func testEmoji() {
        XCTAssert(LogLevel.verbose.emoji() == "🔊")
        XCTAssert(LogLevel.debug.emoji() == "🐞")
        XCTAssert(LogLevel.info.emoji() == "ℹ️")
        XCTAssert(LogLevel.todo.emoji() == "🛠")
        XCTAssert(LogLevel.warning.emoji() == "⚠️")
        XCTAssert(LogLevel.error.emoji() == "‼️")
    }
    
    func testName() {
        XCTAssert(LogLevel.verbose.name() == "Verbose")
        XCTAssert(LogLevel.debug.name() == "Debug")
        XCTAssert(LogLevel.info.name() == "Info")
        XCTAssert(LogLevel.todo.name() == "TODO")
        XCTAssert(LogLevel.warning.name() == "Warning")
        XCTAssert(LogLevel.error.name() == "Error")
    }
}
