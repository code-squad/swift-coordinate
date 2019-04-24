import Foundation

struct Point: Drawable, Equatable {
    
    var points: [Point] {
        return [self]
    }
    
    let x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
}

