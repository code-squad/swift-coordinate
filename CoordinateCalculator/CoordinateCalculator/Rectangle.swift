import Foundation

struct Rectangle {
    
    var leftTop: Point
    var rightBottom: Point
    
    init(origin: Point, size: CGSize) {
        
        leftTop = origin
        rightBottom = Point(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
        
    }
    
}
