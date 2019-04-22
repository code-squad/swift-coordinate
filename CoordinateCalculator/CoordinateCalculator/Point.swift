import Foundation

struct Point: Drawable {
    
    var isDrawable: Bool {
        if ANSICode.CoordinateGrid.gridRange.contains(x),
            ANSICode.CoordinateGrid.gridRange.contains(y) {
            return true
        }
        return false
    }
    
    
    let x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func draw() {
        CoordinateView.draw(point: self)
    }
    
}

