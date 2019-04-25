import Foundation

struct Rectangle: Drawable {
    
    var points: [Point] {
        return [leftTop, rightBottom, Point(x: leftTop.x, y: rightBottom.y), Point(x: rightBottom.x, y: leftTop.y)]
    }
    
    private let leftTop: Point
    private let rightBottom: Point
    
    var size: Int {
        return (rightBottom.x - leftTop.x) * (leftTop.y - rightBottom.y)
    }
    
    var description: String {
        return "직사각형의 넓이: \(size)"
    }
    
    init(origin: Point, size: CGSize) {
        
        leftTop = origin
        rightBottom = Point(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
        
    }
    
    
    
    
}
