import Foundation

struct Coordinate {
    
    //MARK: 속성
    private(set) var x: Int
    private(set) var y: Int
    
    //MARK: 초기화 함수
    init?(x: Int, y: Int) {
        guard
            x <= ANSICode.axis.axisLimit,
            y <= ANSICode.axis.axisLimit,
            x >= 0,
            y >= 0 else {
            return nil
        }
        self.x = x
        self.y = y
    }
    
    
}
