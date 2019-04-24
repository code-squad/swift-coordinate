import Foundation

func main() {
    
    OutputView.drawCoordinatePlane()
    
    do {
        
        let points = try InputView.readCoordinates()
        let shape = try CoordinateCalculator.shaped(points: points)
        try OutputView.draw(shape: shape)
        OutputView.printDescription(shape)
        
    } catch let error as InputError {
        OutputView.printText("입력 오류: \(error.description)")
    } catch let error as OutputError {
        OutputView.printText("출력 오류: \(error.description)")
    } catch let error as CoordinateError {
        OutputView.printText("좌표 계산기 오류: \(error.description)")
    } catch {
        OutputView.printText("예상치 못한 오류: \(error)")
    }
    
    print(ANSICode.cursor.move(row: ANSICode.CoordinateGrid.gridLimit + 5, column: 1))
    
}

main()

