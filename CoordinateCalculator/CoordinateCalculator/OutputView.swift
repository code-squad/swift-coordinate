import Foundation

class OutputView {
    
    //MARK: 비공개 정적 메소드
    private static func moveCursor(row: Int, column: Int) {
        print("\(ANSICode.cursor.move(row:1, column: 1))")
    }
    
    //MARK: 정적 메소드
    static func drawAxis() {
        print(ANSICode.clear + ANSICode.home)
        print(ANSICode.text.magenta + ANSICode.axis.draw())
        
    }
    
    
    
}

