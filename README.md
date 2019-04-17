# ANSI 이스케이프 코드

## ANSI 이스케이프 코드란?
이것은 커맨드 라인의 텍스트의 형식을 지정하기 위해 만들어진 코드입니다. 이 코드는 표준화 되어 대부분의 커맨드 라인 툴에서 작동합니다. 따라서 이 코드를 사용해 색상을 변경하는 등의 텍스트 형식을 변경할 수 있습니다!

## 사용 방법
print할 때에 유니코드 `001B`뒤에 `[`를 입력하고 뒤에 약속된 명령을 입력하면 됩니다.

### 텍스트 색상 8가지 (Swift print 함수 기준)
- Black: \u{001B}[30m
- Red: \u{001B}[31m
- Green: \u{001B}[32m
- Yellow: \u{001B}[33m
- Blue: \u{001B}[34m
- Magenta: \u{001B}[35m
- Cyan: \u{001B}[36m
- White: \u{001B}[37m

### 배경 색상
- Background Black: \u{001B}[40m
- Background Red: \u{001B}[41m
- Background Green: \u{001B}[42m
- Background Yellow: \u{001B}[43m
- Background Blue: \u{001B}[44m
- Background Magenta: \u{001B}[45m
- Background Cyan: \u{001B}[46m
- Background White: \u{001B}[47m

### 서체 바꾸기
- Bold: \u{001B}[1m
- Underline: \u{001B}[4m
- Reversed: \u{001B}[7m

### 초기 설정으로 되돌리기
- Reset: \u{001B}[0m

이외에도 많은 사용 예시가 있습니다.
