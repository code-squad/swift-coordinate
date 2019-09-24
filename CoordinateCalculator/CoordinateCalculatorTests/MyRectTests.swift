//
//  MyRectTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/25.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyRectTests: XCTestCase {
    
    var rects: [MyRect] = {
        let rectA = MyRect(origin: MyPoint(x: 0, y: 0), size: CGSize(width: 10, height: 10))
        let rectB = MyRect(origin: MyPoint(x: 5, y: 5), size: CGSize(width: 15, height: 15))
        let rectC = MyRect(origin: MyPoint(x: 3, y: 3), size: CGSize(width: 20, height: 20))
        return [rectA, rectB, rectC]
    }()
    
    func testRect_return_four_vertices() {
        rects.forEach {
            XCTAssertTrue($0.vertices.count == 4)
        }
    }
    
    func testRect_have_no_distance() {
        rects.forEach {
            guard $0.distance() == 0 else {
                XCTFail()
                return
            }
        }
    }
    
    func testRect_extent_should_same_with_size_width_x_height() {
        let sizeArray = [CGSize(width: 10, height: 10), CGSize(width: 15, height: 15), CGSize(width: 20, height: 20)];
        sizeArray.forEach { (size) in
            let rect = MyRect(origin: MyPoint(x: 0, y: 0), size: size)
            let extent = Double(size.width * size.height)
            XCTAssertTrue(rect.extent().isEqual(to: extent))
        }
    }
}
