## 진행과정

- 2017.11.16 - InputView, OutputView, MyPoint 객체 추가, 터미널에서 좌표 출력되는 것 확인
- 2017.11.17 - CheckingInput, AdjustPoint 객체 추가. 에러처리와 좌표평면의 점이 출력되는 위치를 조정하는 객체를 따로 만들기로 설계하고 틀을 나눔
- 2017.11.20 - CheckingInput, AdjustPoint 객체의 로직을 구체화함. 터미널 환경 상 좌표평면이 출력되는 위치가 실제 사용자가 입력한 위치와 같아보이도록 조정된 좌표객체인 MyPointOutput을 추가함
    - CheckingInput : 사용자 입력값에 대한 에러체크, 입력값을 기호와 좌표값으로 입력한 숫자로 분리
    - AdjustPoint : 터미널 환경 상 좌표평면에 점이 출력되는 위치가 실제 입력한 값이랑 다른 문제를 보완. MyPoint를 가져와서 좌표 숫자를 조정하고 MyPointOutput 객체를 생성함.
- 2017.11.21 - AdjustPoint와 MyPointOutput객체 제거, GenerateMyPoint객체 추가, 에러케이스 추가, main.swift에서 함수의 리턴값을 let변수로 선언하는 방식으로 작성함
    - AdjustPoint와 MyPointOutput객체는 필요 이상으로 객체를 분리한 것이라서 제거하고, 터미널 출력을 위해 값을 조정하는건 OutPutView에서 바로 조정해서 출력. 그래서 OutputView의 drawPoint ()함수도 MyPoint를 매개변수로 받는 것으로 수정.
    - CheckingInput이 책임이 다른 일을 같이 하고있어서 역할이 모호해서, 에러체크를 완료한 정상적인 (Int,Int) 튜플값을 GenerateMyPoint에 넘기고 GenerateMyPoint는 그 튜플값으로 MyPont를 만드는 역할로 분리.
    - CheckingInput에 사용자가 (0,0)을 입력했을때의 에러케이스 추가함.
    - GenerateMyPoint를 Make - 로 바꿈. 
    - ChekingInput의 인스턴스 이름과 함수이름, main.swift에서의 리턴값 변수명을 문맥에맞게/중복이없게 변경함

