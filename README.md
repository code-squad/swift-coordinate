## 좌표계산기

#### 요구사항

- [좌표계산기 - 시작하기](https://nextstep.camp/courses/-KuYS6VK-enZZ_F3Jgg8/-Kv0PHggr8nTD-IwWNRe/lessons/-KvlNnfOLihtQc2WNDTu) 요구사항을 구현한 상태에서 시작한다.

- 사용자가 점에 대한 좌표 정보를 입력하는 메뉴를 구성한다.
- 좌표 정보는 괄호"(", ")"로 둘러쌓여 있으며 쉼표(,)로 x값과 y값을 구분한다.
- X, Y좌표 모두 최대 24까지만 입력할 수 있다.
- 입력 범위를 초과할 경우 에러 문구를 출력하고 다시 입력을 받는다.
- 정상적인 좌표값을 입력한 경우, 해당 좌표에 특수문자를 표시한다.

#### 프로그래밍 요구사항

- 메소드가 너무 많은 일을 하지 않도록 분리하기 위해 노력해 본다.

- 각 객체의 역할과 책임을 구분하도록 노력해 본다.

- 입력을 처리하는 InputView 구조체를 추가하고, 아래 실행 결과처럼 좌표값 입력하는 메뉴를 구현한다.

- main에서 InputView 구조체 readInput() 함수를 호출한다.

- 입력받은 좌표값 X, Y 정보를 처리하기 위한 MyPoint 구조체를 구현한다.

- MyPoint 구조체는 다음과 같은 형태를 가진다.

  ```swift
  struct MyPoint {
    var x = 0
    var y = 0
  }
  ```


- MyPoint 구조체 인스턴스를 OutputView에 넘겨서 출력하는 함수를 추가한다.

- 화면 처리 유의사항
  * 터미널 화면은 뒤집힌 1사분면으로 동작한다. 위쪽이 0이고 아래로 내려올수록 커진다.
  * X좌표축은 화면 비율상 2를 곱해서 표현해야 한다.
  * X좌표축 범례는 Y축으로 25만큼 떨어진 공간에 그려진다.
  * Y좌표축은 터미널 좌표상 3만큼 떨어져서 그려진다. 

#### 실행 결과

```
좌표를 입력하세요.

(10,10)

```

![img](http://public.codesquad.kr/jk/draw-point.png)

#### 힌트

- 출력 화면을 지우는 ANSI코드를 출력하는 방법은 다음과 같다.
  `print("\(ANSICode.clear)\(ANSICode.home)")`

- 
  특정 좌표(1,1)에 커서를 옮기고 싶으면 다음 코드 조각을 활용한다.
  `print("\(ANSICode.cursor.move(row:1, col: 1))")`

- 
  출력하려는 텍스트 컬러값을 바꾸려면 다음 코드 조각을 활용한다.
  `print("\(ANSICode.text.redBright)"RED)`
  `print("\(ANSICode.text.white)"WHITE)`





​    