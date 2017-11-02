import XCTest

class CoordinateCalculatorTests: XCTestCase {
    func testMyPointIsNotNil(){
        let myPoint = MyPoint(x: 3, y: 5)
        XCTAssertNotNil(myPoint)
    }
    
    func testMyLineIsNotNil(){
        let pointA = MyPoint(x: 3, y: 6)
        let pointB = MyPoint(x: 7, y: 9)
        let myLine = MyLine(pointA: pointA, pointB: pointB)
        XCTAssertNotNil(myLine)
    }
    
    func testMyTriangleIsNotNil(){
        let pointA = MyPoint(x: 3, y: 6)
        let pointB = MyPoint(x: 7, y: 9)
        let pointC = MyPoint(x: 5, y: 1)
        let myTriangle = MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        XCTAssertNotNil(myTriangle)
    }
    
    func testMyRectIsNotNil(){
        let origin = MyPoint(x: 4, y: 6)
        let myRect = MyRect(origin: origin, size: CGSize(width: 5, height: 9))
        XCTAssertNotNil(myRect)
    }
}
