//
//  FactsUITests.swift
//  FactsUITests
//
//  Created by Nancy on 10/11/20.
//

import XCTest

class FactsUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.launch()
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)
        
        let tablesQuery = element.tables
        tablesQuery.cells["Eh, heart.fill, A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation."].children(matching: .other).element(boundBy: 0).swipeUp()
        
        let aMooseIsACommonSightInCanadaTallAndMajesticTheyRepresentManyOfTheValuesWhichCanadiansImagineThatTheyPossessTheyGrowUpTo27MetresLongAndCanWeighOver700KgTheySwimAt10KmHMooseAntlersWeighRoughly20KgThePluralOfMooseIsActuallyMeeseDespiteWhatMostDictionariesEncyclopediasAndExpertsWillTellYouStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you."]/*[[".cells[\"Meese, A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km\/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.\"].staticTexts[\"A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km\/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.\"]",".staticTexts[\"A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km\/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aMooseIsACommonSightInCanadaTallAndMajesticTheyRepresentManyOfTheValuesWhichCanadiansImagineThatTheyPossessTheyGrowUpTo27MetresLongAndCanWeighOver700KgTheySwimAt10KmHMooseAntlersWeighRoughly20KgThePluralOfMooseIsActuallyMeeseDespiteWhatMostDictionariesEncyclopediasAndExpertsWillTellYouStaticText.swipeUp()
        aMooseIsACommonSightInCanadaTallAndMajesticTheyRepresentManyOfTheValuesWhichCanadiansImagineThatTheyPossessTheyGrowUpTo27MetresLongAndCanWeighOver700KgTheySwimAt10KmHMooseAntlersWeighRoughly20KgThePluralOfMooseIsActuallyMeeseDespiteWhatMostDictionariesEncyclopediasAndExpertsWillTellYouStaticText.swipeDown()
        tablesQuery.cells["Transportation, It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal."].children(matching: .other).element(boundBy: 0).swipeDown()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
