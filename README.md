# STEP 5-2

## Lesson Learned

### 1) 에러코드에 대한 출력 방식

기존 에러 코드 출력 방식은 다음과 같았다

```swift
import Foundation	

enum ErrorCode : Error {	
    case InvalidInput	    
    case InvalidRange	    
    case IsNotANumber	    
    case SplitStringError	    
    case Unknown
}

let main = {	
    let inputView: InputView = InputView()	    
    var x: Int = 0	   
		let main = {
        do {	       
            (x, y) = try inputView.readInput()	            
            break	            
        }catch ErrorCode.InvalidInput{	        
            print("InvalidInput")	            
            continue	
        }catch ErrorCode.IsNotANumber{	
            print("IsNotANumber")	
            continue	
        }catch ErrorCode.InvalidRange{	
            print("InvalidRange")	
            continue	
        }catch ErrorCode.SplitStringError{	
            print("SplitStringError")	
            continue	            
        }catch {	       
            print("unexpected error")	            
            continue	            
        }	        
    }
```

### 1-1 ) 문제점

- 에러 출력에 대해 main 코드 흐름 상에서 하드코딩하는 방식



### 1-2) 해결 시도 방법 1

> ErrorCode의 각 case에 String 값을 입력하여 rawValue로 출력하는 것

- 한계 
  - ErrorCode는 Error 프로토콜을 채택하므로 String을 같이 쓸 수 없음. 별도의 Enum에 String 값을 관리해야 함
  - 결국 하드코딩 내용을 변수로 옮긴 것에 불과함

### 1-3) 해결 시도 방법 2 - Accepted

> [프로토콜 - CustomStringConvertible](<https://developer.apple.com/documentation/swift/customstringconvertible>)  를 활용할 것 
>
> 해당 프로토콜을 `준수`하려면 `description` 프로퍼티에 대한 정의가 필요함.

```swift
struct Point {
    let x: Int, y: Int
}

let p = Point(x: 21, y: 30)
print(p)
// Prints "Point(x: 21, y: 30)"


```

`description` 프로퍼티를 구현하고 `CustomStringConvertible` 를 **채택**한다는 것을 선언하면, 구조체 Point는 **고유의 커스텀 표현방식**을 갖게 된다.

```swift
extension Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}
print(p)
// Prints "(21, 30)"
```

---



### 1-4) 개선된 에러 출력 방식

```swift
enum ErrorCode : Error, CustomStringConvertible {
    case InvalidInput
    case InvalidRange
    case IsNotANumber
    case SplitStringError
    case Unknown
    var description: String{
        get {
            switch self {
            case .IsNotANumber:
                return "IsNotANumber Error"
            case .InvalidInput:
                return "InvalidInput Error"
            case .InvalidRange:
                return "InvalidRange Error"
            case .SplitStringError:
                return "SplitString Error"
            case .Unknown:
                return "Unknown Error"
            }
        }
    }
}
```

### 1-5) 주의사항

- main 클로저에서 description은 다음과 같이 표현하여 코드를 간결하게 줄일 수 있다.
- `ErrorCode`의 경우를 `errorType` 변수로 받고, 해당 `errorType`에 대한 `description` 출력을 하는 방식

```swift
//...
				}catch let errorType as ErrorCode{
            print(errorType.description)
            continue
        }catch {
            print(ErrorCode.Unknown.description)
            continue
        }
    }
//...
```



### 1-6) 개선시 장점

- ErrorCode` 내의 예외출력문을 `enum`에서 관리하는 이점이 있다.
- main에서의 예외처리 구조가 간결해지고, 추후의 확장에 용이해진다.







------

---



# STEP 5-1

## Lesson Learned

- ANSI Escape Code - ANSI Color 사용법

  - [reference link1](<http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html>)
  - [reference link2](<https://toutiao.io/posts/esgb4k/preview>)
  - [wikipedia defninition](<https://en.wikipedia.org/wiki/ANSI_escape_code>)

  - [cf. ANSI Character sets](<http://ascii-table.com/ansi-codes.php>)
  - [추가 레퍼런스](<http://egloos.zum.com/sunyzero/v/4282610>)

- `ANSI Escape code`는 **터미널의 텍스트 포맷을 제어하기 위해 만들어진 코드**를 의미한다.

  - `ANSI escape code`를 지원하는 터미널이 필요

  - `ANSI escape sequence`의 형태 (ex : \e[m  ; `e`는 esc, `m`은 색상 변경 명령어 라고 보면 된다. 리눅스 예제)

  - **ESC [** 는 **CSI - Control Sequence Introducer** 를 의미.

    - 기타 다른 방법 ( ESC N, ESC O, … )이 존재

    - 마지막 레퍼런스는 linux 기준인데, osx 기준으로는 echo string이 그대로 타이핑 된다.

  - 특수문자, 터미널 글자의 색상 변경 등에 쓰임

  - ASCII 코드 등 ANSI Character set과는 좀 다르다. 

    - 어차피 ANSI (미국 국가표준 협회)에서 제정했다는 사실은 같다.

- swift 에서 esc (escape) 문자는 `\u{001B}`이다. 

  - iterm 터미널에서 `swift` 치고 swift 창으로 변경되고 `print ("\u{001B}[0;33m")` 입력 후 ^D(cmd+D)로 나와보자. 
  - iterm 터미널이 노란색으로 바뀌어있다.

- ANSI Colors

  - 운영체제 또는 터미널에 따라서 지원하는 색상 표기가 다르다. 
  - 초기에는 8 colors만 지원
    - 30-37은 foreground color, 40-47은 background color
  - 256 color 모드도 지원 





-------



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