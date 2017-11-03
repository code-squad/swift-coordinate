import XCTest

class CoordinateCalculatorTests: XCTestCase {
    var myPoint: MyPoint!
    var myLine: MyLine!
    var myTriangle: MyTriangle!
    var myRect: MyRect!
    
    override func setUp() {
        self.myPoint = MyPoint(x: 0, y: 0)
        self.myLine = MyLine(pointA: MyPoint(x: 3, y: 6), pointB: MyPoint(x: 8, y: 4))
        self.myTriangle = MyTriangle(pointA: MyPoint(x: 3, y: 6), pointB: MyPoint(x: 7, y: 9), pointC: MyPoint(x: 5, y: 1))
        self.myRect = MyRect(origin: MyPoint(x: 4, y: 6), size: CGSize(width: 5, height: 9))
    }
    
    override func tearDown() {
        myPoint = nil
        myLine = nil
        myTriangle = nil
        myRect = nil
    }
    
    func testInvalidInputPattern(){
        do{
            try InputView.readInput(rawCoords: "(,,)(1,)")
        }catch{
            XCTAssertNoThrow(OutputView.CoordsError.invalidInputPattern)
        }
    }
    
    func testOutOfCoordSystemBounds(){
        do{
            try InputView.readInput(rawCoords: "(47,9)")
        }catch{
            XCTAssertNoThrow(OutputView.CoordsError.outOfBounds)
        }
    }
    
    func testInvalidRectPoints(){
        do{
            try InputView.readInput(rawCoords: "(3,5)-(1,7)-(8,5)-(9,0)")
        }catch{
            XCTAssertNoThrow(OutputView.CoordsError.invalidRectPoints)
        }
    }
    
    func testZeroException(){
        do{
            try InputView.readInput(rawCoords: "(6,5-(6,5)-(2,8)")
        }catch{
            XCTAssertNoThrow(OutputView.CoordsError.zeroException)
        }
    }
    
    func testMyPointIsNotNil(){
        XCTAssertNotNil(self.myPoint)
    }
    
    func testMyLineIsNotNil(){
        XCTAssertNotNil(self.myLine)
    }
    
    func testIfDistanceOfMyLineIsNotNaN(){
        self.myLine = MyLine(pointA: MyPoint(x: 8, y: 6), pointB: MyPoint(x: 0, y: 4))
        XCTAssertNotEqual(self.myLine.calculate(), Double.nan)
    }
    
    func testMyTriangleIsNotNil(){
        XCTAssertNotNil(self.myTriangle)
    }
    
    func testMyRectIsNotNil(){
        XCTAssertNotNil(self.myRect)
    }
}
