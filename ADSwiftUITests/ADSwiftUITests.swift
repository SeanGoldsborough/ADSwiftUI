//
//  ADSwiftUITests.swift
//  ADSwiftUITests
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import XCTest
import Combine
import SwiftUI
@testable import ADSwiftUI

class ADSwiftUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_createSiteWithSampleSiteData() {

      guard let url = Bundle.main.url(forResource: "MockSitesJSON", withExtension: "json"),
        let data = try? Data(contentsOf: url)
        else { return XCTFail("Mock JSON file missing or data is corrupted") }
      
      let sampleSite: Base

      do {
        sampleSite = try JSONDecoder().decode(Base.self, from: data)
      } catch {
        return XCTFail(error.localizedDescription)
      }

        XCTAssert(sampleSite.sites?.count == 1, "Site array count was expected to be \"1\" but was \"\(sampleSite.sites?.count)\"")
        
        XCTAssert(sampleSite.sites?[0].name == "Building #1", "Site name was expected to be \"Building #1\" but was \"\(sampleSite.sites?.count)\"")
        
        XCTAssert(sampleSite.sites?[0].address == "120 Broadway, New York, NY 10271", "Site address was expected to be \"120 Broadway, New York, NY 10271\" but was \"\(sampleSite.sites?.count)\"")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
