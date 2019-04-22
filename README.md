# 좌표계산기  

## Xcode Project Terminal에서 실행하는 법

1. Project Build (⌘ + B)
2. Project navigator에서 Products 폴더 우클릭
3. Show in Finder
4. Project 실행 파일 (Project와 이름이 똑같은 파일) 끌어다 Terminal에 놓기
5. Enter
6. 끝

## ANSICode
 - ANSI Escape Code는 터미널에서 커서 위치, 색 등등을 제어하기 위한 표준  
 - ISO/IEC 6429 표준으로 지정되어 대부분의 터미널에서 사용 가능
 - **CSI + n[;+...] + letter**의 형태로 사용

#### 예시 **\u{001B}[0;30m**
 - **\u{001B}[** 부분은 CSI(Control Sequence Introducer)
 - **0;30** 부분은 숫자 부분으로 숫자가 여러 개일 때 **;** 으로 구분
 - **m**은 문자 부분으로 명령에 해당됨