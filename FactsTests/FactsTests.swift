//
//  FactsTests.swift
//  FactsTests
//
//  Created by Nancy on 10/11/20.
//

import XCTest
@testable import Facts

class FactsTests: XCTestCase {
   var facts = FactsModel(title: "", rows: [])
    var factsRow : [Facts]!
    
    override func setUp() {
        factsRow = [Facts]()
    }
    
    override func setUpWithError() throws {
        guard let jsonFilePath = Bundle(for: type(of: self)).path(forResource: "Facts", ofType: "json") else {
            XCTFail("JSON file not found")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath))
            facts = try JSONDecoder().decode(FactsModel.self, from: jsonData)
        } catch let error {
            XCTFail("Unable to decode JSON: error = \(error)")
        }
        
    }
    
    func testLoadNavigationTitle() throws {
        XCTAssertEqual(facts.title,"About Canada")
    }
    
    func testLoadAllFacts() throws {
        XCTAssertTrue((facts.rows != nil))
        XCTAssertEqual(facts.rows?.count, 14)
    }
    
    func testLoadFactsData() throws {
        let repo = facts.rows?.first
        XCTAssertEqual(repo?.title, "Beavers")
        XCTAssertEqual(repo?.imageHref, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
        XCTAssertEqual(repo?.description,"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
        
        let repo1 = facts.rows?.filter({ return $0.title == "Flag" }).first
       /* else do {
            XCTFail("Could not find object with title = Flag")
            return
        }*/
        XCTAssertEqual(repo1?.title, "Flag")
        XCTAssertEqual(repo1?.description, nil)
        XCTAssertEqual(repo1?.imageHref, "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
        
        let repo2 = facts.rows?.filter({ return $0.title == nil }).first
       /* else do {
            XCTFail("Could not find object with title = Flag")
            return
        }*/
        XCTAssertEqual(repo2?.title, nil)
        XCTAssertEqual(repo2?.description, nil)
        XCTAssertEqual(repo2?.imageHref, nil)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
