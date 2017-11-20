## 진행과정

- 2017.11.16 - InputView, OutputView, MyPoint 객체 추가, 터미널에서 좌표 출력되는 것 확인
- 2017.11.17 - CheckingInput, AdjustPoint 객체 추가. 에러처리와 좌표평면의 점이 출력되는 위치를 조정하는 객체를 따로 만들기로 설계하고 틀을 나눔
- 2017.11.20 - CheckingInput, AdjustPoint 객체의 로직을 구체화함. 터미널 환경 상 좌표평면이 출력되는 위치가 실제 사용자가 입력한 위치와 같아보이도록 조정된 좌표객체인 MyPointOutput을 추가함
    - CheckingInput : 사용자 입력값에 대한 에러체크, 입력값을 기호와 좌표값으로 입력한 숫자로 분리
    - AdjustPoint : 터미널 환경 상 좌표평면에 점이 출력되는 위치가 실제 입력한 값이랑 다른 문제를 보완. MyPoint를 가져와서 좌표 숫자를 조정하고 MyPointOutput 객체를 생성함.
