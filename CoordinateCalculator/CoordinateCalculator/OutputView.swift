import Foundation

struct OutputView {
    
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
    
    private static func draw(point: Point) throws {
        guard  ANSICode.CoordinateGrid.gridRange.contains(point.x), ANSICode.CoordinateGrid.gridRange.contains(point.y) else {
                throw OutputError.notDrawableRange
        }
        moveCursorTo(x: point.x, y: point.y)
        print(ANSICode.text.redBright + "●")
    }
    
    //MARK: 메소드
    static func drawCoordinatePlane() {
        print(ANSICode.clear + ANSICode.text.cyanBright + ANSICode.CoordinateGrid.draw())
    }
    
    static func draw(shape: Drawable) throws {
        for point in shape.points {
            try draw(point: point)
        }
    }
    
    static func printDescription(_ shape: Drawable) {
        if let shape = shape as? CustomStringConvertible {
            printText(shape.description)
        }
    }
    
    static func printText(_ text: String) {
        print(ANSICode.cursor.move(row: ANSICode.CoordinateGrid.gridLimit + 5, column: 1) + text)
    }
    
    
}

enum OutputError: Error, CustomStringConvertible {
    
    case notDrawableRange
    
    var description: String {
        switch self {
        case .notDrawableRange:
            return "그릴 수 있는 범위가 아닙니다."
        }
        
    }
}
