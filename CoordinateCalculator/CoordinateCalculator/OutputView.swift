import Foundation

struct OutputView {
    
    //MARK: 비공개 정적 메소드
    private static func moveCursorTo(x: Int, y: Int) {
        let defaultColumn = 3
        let defaultRow = 25
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
    
    //MARK: 정적 메소드
    static func drawAxis() {
        print(ANSICode.clear)
        print(ANSICode.text.cyanBright + ANSICode.axis.draw())
    }
    
    static func drawPoint(x: Int, y: Int) {
        moveCursorTo(x: x, y: y)
        print(ANSICode.text.redBright + "O" + ANSICode.home)
    }
    
    
    
}

