//
//  LiteralPointValidatorTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class StringPointParserTests: XCTestCase {

    func testStringPointParser_valid_string_return_true() {
        let parser = StringPointParser()
        let strings = ["(0,0)", "(0,24)", "(24,24)", "(10,10)", "(24,0)"]
        let points = [(x: 0,y: 0), (x: 0,y: 24), (x: 24,y: 24), (x: 10,y: 10), (x: 24,y: 0)]
        
        for (index, string) in strings.enumerated() {
            guard let point = try? parser.parse(userInput: string).first else {
                XCTFail()
                return
            }
            XCTAssertTrue(point.x == points[index].x && point.y == points[index].y )
        }
    }
    
    func testStringPointParser_invalid_string_return_empty_array() {
        let parser = StringPointParser()
        let strings = ["(-110,0)", "(0-,24)", "=((24,24)", "(10,10)(10,10)", "(24,022)"]
        
        strings.forEach {
            do {
                _ = try parser.parse(userInput: $0)
                XCTFail()
            }
            catch let e {
                guard let error = e as? UserInputError else {
                    XCTFail()
                    return
                }
                XCTAssertTrue( error == UserInputError.inputParsingError )
            }
        }
        }
    }

}
