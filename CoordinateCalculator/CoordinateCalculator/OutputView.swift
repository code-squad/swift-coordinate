import Foundation

struct OutputView {
    
    static func drawAxis() {
        print(ANSICode.clear)
        print(ANSICode.text.magenta + ANSICode.axis.draw())
    }
    
}
