import Foundation

struct Coordinate {
    
    //MARK: 속성
    private(set) var x: Int
    private(set) var y: Int
    
    //MARK: 초기화 함수
    init?(x: Int, y: Int) {
        guard (x, y) <= (ANSICode.axis.axisLimit, ANSICode.axis.axisLimit) else {
            return nil
        }
        self.x = x
        self.y = y
    }
    
    
}
