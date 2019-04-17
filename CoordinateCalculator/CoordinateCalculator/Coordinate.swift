import Foundation

struct Coordinate {
    
    //MARK: 속성
    var row: Int
    var column: Int
    
    //MARK: 초기화 함수
    init?(row: Int, column: Int) {
        guard (row, column) <= (ANSICode.axis.axisLimit, ANSICode.axis.axisLimit) else {
            return nil
        }
        self.row = row
        self.column = column
    }
    
    
}
