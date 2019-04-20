import Foundation

struct TextView {
    
    private var currentLine = ANSICode.CoordinateGrid.gridLimit + 3
    
    //MARK: 비공개 메소드
    mutating private func ask(about question: String) throws -> String {
        printText(ANSICode.text.yellow + question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        returnToCurrentLine()
        return input
    }
    
    mutating private func returnToCurrentLine() {
        print("\(ANSICode.cursor.move(row: currentLine, column: 1))", terminator: "")
        currentLine += 1
    }
    
    //MARK: 메소드
    /// 좌표값 문자열을 입력받아 점 배열로 반환합니다.
    mutating func readCoordinates() throws -> [Point] {
        let input = try ask(about: "좌표를 입력하세요.")
        return try InputControl.points(input: input)
    }
    
    /// 현재 라인으로 커서를 이동시키고 문자열을 출력합니다.
    mutating func printText(_ text: String) {
        returnToCurrentLine()
        print(text)
    }
    
    
}
