import Foundation

func main() {
    
    OutputView.drawCoordinatePlane()
    var textView = InputView()
    var coordinateCalculator = CoordinateCalCulator()
    
    do {
        
    } catch let error as InputError {
        textView.printText("입력 오류: \(error.description)")
    } catch let error as CoordinateCalculatorError {
        textView.printText("좌표 계산기 오류: \(error.description)")
    } catch {
        textView.printText("예상치 못한 오류: \(error)")
    }
    
    
    
}

main()

