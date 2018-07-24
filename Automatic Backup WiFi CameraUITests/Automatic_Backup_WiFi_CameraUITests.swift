//
//  Automatic_Backup_WiFi_CameraUITests.swift
//  Automatic Backup WiFi CameraUITests
//
//  Created by Shivang Dave on 7/16/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import XCTest
@testable import Automatic_Backup_WiFi_Camera

class Automatic_Backup_WiFi_CameraUITests: XCTestCase {
    
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app = nil
    }
    
    func testExample()
    {
        
    }
    
}
