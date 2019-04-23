import Foundation

struct Line: Drawable, CustomStringConvertible {
    
    var points: [Point] {
        return [start, end]
    }

    var distance: Double {
        return sqrt(pow(Double(start.x - end.x), 2) + pow(Double(start.y - end.y), 2))
    }
    
    var description: String {
        return "두 점 사이의 거리: \(distance)"
    }
    
    let start: Point
    let end: Point
    
    init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
    
    
}
