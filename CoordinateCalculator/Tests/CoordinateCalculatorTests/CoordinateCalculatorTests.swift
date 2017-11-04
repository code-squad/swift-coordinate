import XCTest

class CoordinateCalculatorTests: XCTestCase {

    func testOutOfCoordSystemBounds() {
        do{
            try FigureFactory.produceFigure(from: [MyPoint(x: 47, y: 9)])
        }catch{
            XCTAssertNoThrow(FigureFactory.CoordsError.outOfBounds)
        }
    }
    
    func testInvalidRectPoints() {
        do{
            try FigureFactory.produceFigure(from: [MyPoint(x: 3, y: 5), MyPoint(x: 1, y: 7), MyPoint(x: 8, y: 5), MyPoint(x: 9, y: 0)])
        }catch{
            XCTAssertNoThrow(FigureFactory.CoordsError.invalidRectPoints)
        }
    }
    
    func testZeroException() {
        do{
            try FigureFactory.produceFigure(from: [MyPoint(x: 6, y: 5), MyPoint(x: 6, y: 5), MyPoint(x: 2, y: 8)])
        }catch{
            XCTAssertNoThrow(FigureFactory.CoordsError.zeroException)
        }
    }
    
    func testMyPointIsNotNil() {
        XCTAssertNotNil(MyPoint(x: 5, y: 6))
    }
    
    func testMyLineIsNotNil() {
        let pointA = MyPoint(x: 8, y: 7)
        let pointB = MyPoint(x: 3, y: 9)
        XCTAssertNotNil(MyLine(pointA: pointA, pointB: pointB))
    }
    
    func testIfDistanceOfMyLineIsNotNaN() {
        let myLine = MyLine(pointA: MyPoint(x: 8, y: 6), pointB: MyPoint(x: 0, y: 4))
        XCTAssertNotEqual(myLine.calculate(), Double.nan)
    }
    
    func testMyTriangleIsNotNil() {
        let pointA = MyPoint(x: 8, y: 7)
        let pointB = MyPoint(x: 3, y: 9)
        let pointC = MyPoint(x: 5, y: 19)
        let myTriangle = MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        XCTAssertNotNil(myTriangle)
    }
    
    func testMyRectIsNotNil() {
        let myRect = MyRect(origin: MyPoint(x: 8, y: 7), size: CGSize(width: 10, height: 20))
        XCTAssertNotNil(myRect)
    }
    
}
