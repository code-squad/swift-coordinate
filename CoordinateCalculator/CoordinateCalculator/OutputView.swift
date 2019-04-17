import Foundation

struct OutputView {
    
    //MARK: 비공개 정적 메소드
    private static func moveCursorTo(row: Int, column: Int) {
        let defaultRow = 3
        let defaultColumn = 23
        
        let resultRow = move(row: defaultRow, move: row)
        let resultColumn = move(column: defaultColumn, move: column)
        
        print("\(ANSICode.cursor.move(row: resultRow, column: resultColumn))")
    }
    
    private static func move(row: Int, move rate: Int) -> Int {
        return row + rate * 2
    }
    private static func move(column: Int, move rate: Int) -> Int {
        return column - rate
    }
    
    //MARK: 정적 메소드
    static func drawAxis() {
        print(ANSICode.clear + ANSICode.home)
        print(ANSICode.text.magenta + ANSICode.axis.draw())
    }
    
    static func drawPoint(row: Int, column: Int) {
        moveCursorTo(row: row, column: column)
        print("*")
    }
    
    
    
}

