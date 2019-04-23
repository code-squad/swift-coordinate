import Foundation

struct CoordinateView {
    
    //MARK: 비공개 메소드
    private static func moveCursorTo(x: Int, y: Int) {
        let defaultColumn = 3
        let defaultRow = ANSICode.CoordinateGrid.gridLimit + 1
        let resultColumn = move(x: defaultColumn, by: x)
        let resultRow = move(y: defaultRow, by: y)
        print(ANSICode.cursor.move(row: resultRow, column: resultColumn), terminator: "")
    }
    
    private static func move(x: Int, by rate: Int) -> Int {
        return x + rate * 2
    }
    
    private static func move(y: Int, by rate: Int) -> Int {
        return y - rate
    }
    
    //MARK: 메소드
    static func drawCoordinatePlane() {
        print(ANSICode.clear + ANSICode.text.cyanBright + ANSICode.CoordinateGrid.draw())
    }
    
    private static func draw(point: Point) {
        moveCursorTo(x: point.x, y: point.y)
        print(ANSICode.text.redBright + "●")
    }

    
    static func draw(shape: Drawable) {
        for point in shape.points {
            draw(point: point)
        }
    }

    
}
