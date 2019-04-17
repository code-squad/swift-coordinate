## 좌표계산기

### 1. 프로그램 설계하기

#### 요구사항	

- 좌표축을 구현하고 iterm에서 확인해본다.
- 출력을 담당하는 구조체를 추가하고, 좌표축을 출력할 함수를 구현한다.
- main에서 출력할 함수를 호출한다.

#### 구현하기

##### 1. xcode 설정

- xcode 에서 iterm으로 run을 하기 위해서는 설정이 필요했다. **Edit Scheme -> Run -> Info -> Executable** 에서 iterm.app 으로 변경 후 **Arguments -> Arguments Passed On Launch **에서 

  ```${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}```

  을 추가시켜줬다. 

- 하지만 위와 같이 하면 좌표축은 그릴 수 있으나 **Warning A session ended very soon after starting. Check that the command in profile "Default" is correct."** 와 같은 오류가 발생하면서 좌표축이 그려진 창이 종료되는 문제가 발생했다. 그래서 **Preferences > Profiles > Session > Automatically close a session when it ends** 체크를 해제하자 종료여부를 내가 선택할 수 있게 되었다.

##### 2. ANSI code의 이해

- 터미널에서 ANSI escape 코드를 사용하기 위해서는 지원을 해야 하지만, 대부분의 리눅스, 유닉스 터미널에서는 지원을 한다고 한다. 하지만 맥의 기본 터미널에서 모든 기능을 지원하는 것은 아닌 것 같다 ( 참고: [링크](<https://stackoverflow.com/questions/25879183/can-terminal-app-be-made-to-respect-ansi-escape-codes>) )
- 가령 **\u{001B}[0;30m** 와 같은 코드가 있을 때 이와 같은 형태를 **ANSI escape sequence** 라고 한다. **\u{001B}[** 부분을 **CSI(Control Sequence Introducer)** 라고 부른다
- ANSI escape sequence는 크게 보면 **CSI + 숫자 + 영문자** 하나로 구성되어 있다.CSI 다음에 나오는 부분은 숫자이며 복수개가 나올때는 세미콜론(;)으로 구분한다. 위 코드를 보면 0;30으로 복수개라 세미콜론으로 구분지어져 있다. 마지막 영문자 1개는 ANSI escape sequence의 명령에 해당한다. T는 스크롤 다운, m은 색상 변경등의 기능을 가진다. ( 참고: [링크1](http://sunyzero.egloos.com/4282610), [링크2](<https://en.wikipedia.org/wiki/ANSI_escape_code#CSI_sequences>) )

##### 3. 함수 구현

- 미리 정의되어 있는 ANSICode 구조체의 코드를 분석하여 활용하였다. 글씨 색상, 배경색상, 커서이동, 좌표축을 그리는 함수, 도형을 그리는 함수에 대한 부분이 정의되어 있다. OutputView의 drawAxis()를 정의하여 CSI+2+J와 CSI + 0;0 + H 를 통해 화면을 비우고 커서를 (1,1)에 위치시킨 다음 1사분면을 출력하도록 구현하였다. 