# 진행 방법

- 좌표 계산기에 대한 요구사항을 파악한다.
- 요구사항에 대한 구현을 완료한 후 자신의 github 아이디에 해당하는 브랜치에 Pull Request(이하 PR)를 통해 코드 리뷰 요청을 한다.
- 코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.
- 모든 피드백을 완료하면 다음 단계를 도전하고 앞의 과정을 반복한다.

# 코드 리뷰 과정
> 저장소 브랜치에 자신의 github 아이디에 해당하는 브랜치가 존재해야 한다.
>
> 자신의 github 아이디에 해당하는 브랜치가 있는지 확인한다.

1. 자신의 github 아이디에 해당하는 브랜치가 없는 경우 브랜치 생성 요청 채널을 통해 브랜치 생성을 요청한다.
프로젝트를 자신의 계정으로 fork한다. 저장소 우측 상단의 fork 버튼을 활용한다.

2. fork한 프로젝트를 자신의 컴퓨터로 clone한다.
```
git clone https://github.com/{본인_아이디}/{저장소 아이디}
ex) https://github.com/godrm/swift-laddergame
```

3. clone한 프로젝트 이동
```
cd {저장소 아이디}
ex) cd swift-laddergame
```

4. 본인 아이디로 브랜치를 만들기 위한 checkout
```
git checkout -t origin/본인_아이디
ex) git checkout -t origin/godrm
```

5. commit
```
git status //확인
git rm 파일명 //삭제된 파일
git add 파일명(or * 모두) // 추가/변경 파일
git commit -m "메세지" // 커밋
```

6. 본인 원격 저장소에 올리기
```
git push origin 본인_아이디
ex) git push origin godrm
```

7. pull request
8. pull request는 github 서비스에서 진행할 수 있다.
9. pull request는 반드시 original 저장소의 브랜치와 fork한 자신의 저장소 브랜치 이름이 같아야 하며, 브랜치 이름은 자신의 github 아이디여야 한다.
10. code review 및 push
11. pull request를 통해 피드백을 받는다.
12. 코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.

## 앞의 코드 리뷰 과정은 [영상 보기](https://www.youtube.com/watch?v=ZSZoaG0PqLg) 를 통해 참고 가능

## 실습 중 모든 질문은 슬랙 채널에서...

# 프로젝트 진행 중 학습한 내용
1. ANSICode
> cursor 구조체의 move 메서드를 쓰면 입력한 좌표로 이동한다. 이동 한 뒤에 문자가 있다면 해당 좌표에 문자를 출력한다.
> axis 구조체의 draw 메서드를 쓰면 drawX, drawY 메서드를 실행시키며 X축과 Y축 기준 좌표계를 출력한다.
> ANSICode 구조체 내부에 text 구조체를 통해서 출력할 색상을 선택할 수 있다.


# JK 의 피드백
1. 주요 객체, 구조체, 타입을 선언하는 경우라면 별도 파일로 분리
> JK 의 피드백을 받고 객체, 구조체, 타입을 선언하는 경우 별도 파일로 분리하였다.
> enum, error 등의 타입도 별도 파일로 분리하였다.

2.  main() 함수 이외에 함수는 꼭 어딘가 타입에 소속되도록 포함
> main 파일에 별도로 함수를 선언하였었는데 연관된 타입에 종속되도록 작성하였다.

3. inputView 등 한가지 역할을 하는 구조체에는 다른 작업 시키지 말기
> inputView 에서 좌표 계산, 입력값 처리, 정합성 검사 등을 하였는데 inputView 에서는 입력값만 받고 별도 작업은 다른 구조체를 선언하던지 해서 구조체는 한가지 역할만 하도록 수정하였다.

4. 문구 출력이나 흐름 제어는 최상위 모듈에서 처리
> 흐름 제어를 하위 모듈에서 진행하면 어디서 루프가 걸리고 문구 출력이 되는지 알기 힘들기 때문에 최상위 모듈에서 처리하였다.

5. 데이터를 보관하는 객체와 어떤 로직에 따라서 데이터/타입을 만들어 내는 객체를 혼용하지 마세요.
> 데이터를 저장하는 객체에서 해당 데이터에 대한 처리를 하는 것이 맞다고 생각하였다. JK 의 피드백은 데이터를 보관하는 객체 따로, 데이터/타입을 가지고 연산하거나 만들어내는 객체를 따로 두라는 것이었다. 공감하였고 그렇게 변경하였다.

6. String, String.SubSequence, Substring 타입 차이점 정리
> String : 일반적인 문자열 타입이다.
> String.SubSequence : Substring 의 별명이다. typealis 로 String 타입에 선언되어있다.
> Substring : 문자열에 소속되는 하위 문자열이다. 오래도록 값을 쓰기 위해서는 String 으로 형변환해서 저장해야한다. 왜냐하면 Substring 은 상위 문자열의 모든 Substring 을 가지고 있기 때문에 상위 문자열이 변경되거나 여러번 쓰이는 경우 메모리 손해가 발생한다.