import Foundation

class OutputView {
    
    static func drawAxis() {
        print(ANSICode.clear + ANSICode.home)
        print(ANSICode.text.magenta + ANSICode.axis.draw())
        
    }
    
    static func moveCursor() {
        
        print("\(ANSICode.cursor.move(row:1, col: 1))")

    }
    
    
    
    
    
}

