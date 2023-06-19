//
//  DStoreAppTests.swift
//  DStoreAppTests
//
//  Created by Caio Cardozo on 13/06/23.
//

import XCTest
@testable import DStoreApp

final class DStoreAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // test Init Detail controller
    func testDetailItemViewController(){
        let viewController = DetailItemViewController(name: "name", info: "information")
        XCTAssertEqual(viewController.name, "name")
        XCTAssertEqual(viewController.info, "information")
    }
    // test Init Home controller
    func testHomeViewControllerNib(){
        let vc = HomeViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
        XCTAssertEqual(vc.customView.nameUserLabel.text, "Olá Maria")
    }
    
    // test decode Product object to the word description
    func testProductDecodedSuccess() throws {
        let decoder = JSONDecoder()
        let data = Data("{\"name\": \"XBOX\", \"imageURL\": \"https://s3-sa-east-1.amazonaws.com\", \"description\": \"Com o e-Gift Card Level Up você adquire créditos\"}".utf8)
        let container = try decoder.decode(Product.self, from: data)
        XCTAssertEqual(container.info, "Com o e-Gift Card Level Up você adquire créditos")
        XCTAssertEqual(container.name, "XBOX")
        XCTAssertEqual(container.imageURL, "https://s3-sa-east-1.amazonaws.com")
    }
    // test decode Spotlight object to the word description
    func testSpotlightDecodedSuccess() throws {
        let decoder = JSONDecoder()
        let data = Data("{\"name\": \"Recarga\", \"bannerURL\": \"https://s3-sa-east-1.amazonaws.com\", \"description\": \"Agora ficou mais fácil colocar créditos\"}".utf8)
        let container = try decoder.decode(Spotlight.self, from: data)
        XCTAssertEqual(container.info, "Agora ficou mais fácil colocar créditos")
        XCTAssertEqual(container.name, "Recarga")
        XCTAssertEqual(container.bannerURL, "https://s3-sa-east-1.amazonaws.com")
    }
    // test decode Cash object to the word description
    func testCashDecodedSuccess() throws {
        let decoder = JSONDecoder()
        let data = Data("{\"title\": \"cash\", \"bannerURL\": \"https://s3-sa-east-1.amazonaws.com\", \"description\": \"Dinheiro na conta sem complicação\"}".utf8)
        let container = try decoder.decode(Cash.self, from: data)
        XCTAssertEqual(container.info, "Dinheiro na conta sem complicação")
        XCTAssertEqual(container.title, "cash")
        XCTAssertEqual(container.bannerURL, "https://s3-sa-east-1.amazonaws.com")
    }
}
