//
//  mvc_introTests.swift
//  mvc-introTests
//
//  Created by David Rifkin on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import XCTest
@testable import mvc_intro

class mvc_introTests: XCTestCase {

    override func setUp() {
        let theName = "david"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecodeDogJson() {
        
        let testBundle = Bundle(for: type(of: self))
        guard let pathToData = testBundle.path(forResource: "dog", ofType: "json") else { XCTFail("Couldn't find json file")
            return
        }
        
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            let dogs = try Dog.decodeDogs(from: data)
            
            XCTAssert(dogs != nil, "We couldn't get those dogs")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }

    func testNewDogTag() {
        let dogs = [Dog(name: "fido", dogTag: 3),Dog(name: "rufus", dogTag: 15)]
        
        //create new dog here
        let newTag = Dog.getNewDogTag(existingDogs: dogs)
        let newDog = Dog(name: "spike", dogTag: newTag)
        XCTAssert(newTag == 16, "New tag function does not return the correct value")
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        XCTAssert(1 == 1, "the numbers weren't equal")
//    }
//
//    func testThatLettersMatch() {
//        XCTAssert("david" == "davID".lowercased(), "the string weren't the same")
//    }
}
