import Foundation

struct Point: Drawable {
    
    var description: String {
        return "점의 위치는 x: \(x), y: \(y)"
    }
    
    var points: [Point] {
        return [self]
    }
    
    
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
    
}

