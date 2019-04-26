좌표계산기

### 1. 프로그램 설계하기

#### 요구사항	

- 좌표축을 구현하고 iterm에서 확인해본다.
- 출력을 담당하는 구조체를 추가하고, 좌표축을 출력할 함수를 구현한다.
- main에서 출력할 함수를 호출한다.

#### 구현하기

##### 1. xcode 설정

- xcode 에서 iTerm으로 run을 하기 위해서는 설정이 필요했다. **Edit Scheme -> Run -> Info -> Executable** 에서 iTerm.app 으로 변경 후 **Arguments -> Arguments Passed On Launch** 에서 

  ```${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}```

  을 추가시켜줬다. 

- 하지만 위와 같이 하면 좌표축은 그릴 수 있으나 **Warning A session ended very soon after starting. Check that the command in profile "Default" is correct."** 와 같은 오류가 발생하면서 좌표축이 그려진 창이 종료되는 문제가 발생했다. 그래서 iTerm의 **Preferences > Profiles > Session > Automatically close a session when it ends** 체크를 해제하자 종료여부를 내가 선택할 수 있게 되었다.
- 위 과정을 거쳐도 만약 iterm2가 full screen으로 출력되지 않는다면 x축이 완전하지 않게 보인다. iTemr2에서 **Preferences -> profiles -> Setting for new Windows -> style** 을 **Fullscreen** 으로 바꿔준다. 그러면 문제가 해결된다. 

##### 2. ANSI code의 이해

- 터미널에서 ANSI escape 코드를 사용하기 위해서는 지원을 해야 하지만, 대부분의 리눅스, 유닉스 터미널에서는 지원을 한다고 한다. 하지만 맥의 기본 터미널에서 모든 기능을 지원하는 것은 아닌 것 같다 ( 참조: [링크](<https://stackoverflow.com/questions/25879183/can-terminal-app-be-made-to-respect-ansi-escape-codes>) )
- 가령 **\u{001B}[0;30m** 와 같은 코드가 있을 때 이와 같은 형태를 **ANSI escape sequence** 라고 한다. **\u{001B}[** 부분을 **CSI(Control Sequence Introducer)** 라고 부른다
- ANSI escape sequence는 크게 보면 **CSI + 숫자 + 영문자** 하나로 구성되어 있다.CSI 다음에 나오는 부분은 숫자이며 복수개가 나올때는 세미콜론(;)으로 구분한다. 위 코드를 보면 0;30으로 복수개라 세미콜론으로 구분지어져 있다. 마지막 영문자 1개는 ANSI escape sequence의 명령에 해당한다. T는 스크롤 다운, m은 색상 변경등의 기능을 가진다. ( 참조: [링크1](http://sunyzero.egloos.com/4282610), [링크2](<https://en.wikipedia.org/wiki/ANSI_escape_code#CSI_sequences>) )

##### 3. 함수 구현

- 미리 정의되어 있는 ANSICode 구조체의 코드를 분석하여 활용하였다. 글씨 색상, 배경색상, 커서이동, 좌표축을 그리는 함수, 도형을 그리는 함수에 대한 부분이 정의되어 있다. OutputView의 drawAxis()를 정의하여 CSI+2+J와 CSI + 0;0 + H 를 통해 전체 화면을 비우고 커서를 (0,1)에 위치시킨 다음 1사분면을 출력하도록 구현하였다. 만약 CSI + 1 + J라면 커서부터 화면 처음까지 clear 시키게 된다.

### 2. 좌표 입력과 출력

#### 요구사항

- 좌표 입력은 (3, 5)와 같이 입력하며 쉼표(,)로 x값과 y값을 구분한다.
- x, y는 24까지만 입력할 수 있다. 범위 초과시 에러 메시지를 출력해야 한다.
- 정상 좌표일 경우 해당 좌표에 특수문자를 표시한다.

#### 구현하기

##### 1. 구조체 생성

- 각 역할에 맞는 구조체를 생성하였다.
  - InputView: 입력 담당
  - OutputView: 출력 담당
  - MyPoint: 좌표
  - Inspection: 입력값 검증
  - Convertor: 값 변환
- 전체적인 구조는 입력값을 받으면 Inspeciton 구조체를 통해 검증하고 MyPoint 구조체로 객체를 넘겨서 OutputView를 통해 화면에 출력하도록 구성하였다.

##### 2. 입력값 검증

- 검증 메소드는 입력값에 문제가 없으면 true, 있으면 false를 반환하도록 구현하였다.
  - isEntered(): 값을 입력하였는지 검증한다.
  - hasBracket(): 괄호를 통한 값 입력이 되었는지 검증한다. 하나라도 없으면 false를 반환한다.
  - isTwo(): 두 값을 모두 입력했는지 검증한다. Convertor 구조체의 intialize를 통해 생성된 값을 remove(bracket:)을 통해 괄호를 없애고 splitComma(from:)을 통해 comma 기준으로 나누어 리스트를 생성한다. 이렇게 구해진 값을 count를 통해 검증한다.
  - isExcced(): 24를 초과하는 값을 가지는지 검증한다. Ansicode 구조체의 axis 구조체에 AxisLimit가 정의되어 있어서 이를 활용하였다.
- 검증 실패시 출력되는 메시지는 InputError라는 enum 으로 정의하였다.
  - customStringConvertible 프로토콜을 채택하여 텍스트를 표현하기 편리하도록 하였다.
  - 메시지 출력은 OutputView에 정의한 printError(message:)를 통해 출력될 수 있도록 하였다.
- 검증하는데 필요한 값들은 Convertor 구조체에 정의한 메소들들을 이용하도록 하였다.

#### 3. 특수문자 표시

- drawAxis를 통해 좌표를 그리고 특수문자를 표시하도록 하였다.
- 화면에 아래와 같은 에러 메시지가 출력되기 때문에  아래 코드를 통해 커서를 옮김으로써 해결하였다.

```swift
print("\(ANSICode.cursor.move(row: axisBound + 3, col: axisBound + 3))")
```

<img src="https://d2ddoduugvun08.cloudfront.net/items/2S2E0j232t1O1K2h3f0a/before.png" width="400px" style="display: inline-block;">

<img src="https://d2ddoduugvun08.cloudfront.net/items/370e3J0m1U1V2K3c202F/after.png" width="400px" style="display: inline-block;">