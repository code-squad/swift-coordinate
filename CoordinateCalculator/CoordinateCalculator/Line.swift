import Foundation




struct Line: Shape {
    
    private(set) var points: [Point]
    
    private let start: Point
    private let end: Point
    private let distance: Double
    
    init(start: Point, end: Point) {
        self.start = start
        self.end = end
        points = [start, end]
        distance = Line.distanceBetween(start: start, end: end)
    }
    
    /// 두 점 사이의 거리를 반환합니다.
    private static func distanceBetween(start: Point, end: Point) -> Double {
        return sqrt(pow(Double(start.x - end.x), 2) + pow(Double(start.y - end.y), 2))
    }
    
    func description() -> String {
        return "두 점 사이의 거리는 \(distance)"
    }
    
}
