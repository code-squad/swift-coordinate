import Foundation

private func distanceBetween(start: Point, end: Point) -> Double {
    return sqrt(pow(Double(start.x - end.x), 2) + pow(Double(start.y - end.y), 2))
}

struct Line {
    
    let start: Point
    let end: Point
    let distance: Double
    
    init(start: Point, end: Point) {
        self.start = start
        self.end = end
        distance = distanceBetween(start: start, end: end)
    }
    
    func description() -> String {
        return "두 점 사이의 거리는 \(distance)"
    }
    
}
