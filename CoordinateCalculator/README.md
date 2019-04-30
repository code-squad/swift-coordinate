# STEP 5. 좌표계산기

&nbsp;

### :clipboard: Table Of Contents

- [step 5-1]()
- [step 5-2]()
- [step 5-3]()

&nbsp;

모든 설계시 

입력 - 처리 - 출력 구조로 짠다.

## 프로그램 구성 요소

- 입력 - 처리 - 출력 (hw와 비슷)
- 단계 
  1. **입력**
  2. **처리**
  3. **저장 - 처리된 결과를 저장하기 위한 자료구조(data structure) 고려하기**
  4. **출력을 위한 형식 지정**
  5. **출력**
- 출력을 위한 자료구조를 만들지 말고, 출력이 바뀌어도 자료구조는 변함이 없게끔 설계
- 4,5는 출력 관련 단계



## :pushpin: step 5-1 

### ANSI Code

1. **ASCII Code**

   - 8bit(1byte) 중 7bit를 사용하여 문자를 나타내는 코드
   - 총 128개 문자 표현 가능 (0 ~ 127)
   - 나머지 1bit : parity bit (even/odd for error detecting)
   - 영어만을 고려하여 설계됨
2. **ANSI Code**
   - 8bit, ASCII Code와 compatible(호환가능) 
   - 앞 7bit는 ASCII Code와 동일
   - 뒤의 1bit로 영어가 아닌 다른 언어를 표현(CodePage)

3. **ANSI Escape Code**
   terminal 안에서 cursor 위치를 옮기고, 색상을 변경하는 등의 동작을 할 수 있는 일련의 sequence standard

   - 형식 : ```esc[<동작> ``` - escape 문자 이후에 termainal에서 하고자 하는 동작을 넣음

   - escape(esc) : ```\u{001B}```

   - clear: ```esc[2J```

   - home (좌표 원점) : ```esc[line;colH]``` or ```esc[line;colf```

   - white bright: ```esc[37;1m```

   - 그외 escape reference

     [Build your own Command Line with ANSI escape codes](http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html)

     [ANSI Escape Code](<http://ascii-table.com/ansi-escape-sequences.php>)

&nbsp;

&nbsp;

## :pushpin: Step 5-2

### String 자르는 여러가지 방법

1. 기준 Character로 자르기

   매개변수로 넘겨준 String를 기준으로 String을 나누어 String 배열로 반환해줌

   ```swift
   // struct String 
   func components<T>(separatedBy separator: T) -> [String] where T : StringProtocol
   
   //example
   let sample = "hello, there"
   let dividedSample = sample.components(seperatedBy: ",")
   // ["hello", " there"]
   
   ```

2. Index 사용하기 ( type : ```String.Index``` )

   - String - stored property index  

     ```swift
     let test = "study hard"
     
     test.startIndex 
     //the position of the first character in a nonempty string
     
     test.endIndex
     //a string's past the end position
     //string 마지막 인덱스보다 +1 한 값!!
     ```

   - Index 찾기

     ``` swift
     //여러가지 형태..
     func index(_ i: Self.Index, offsetBy distance: Int) -> Self.Index
     
     //example
     let test = "incredible"
     
     test.index(before: test.endIndex) // index of "e"
     test.index(after: test.startIndex) // index of "n"
     test.index(input.startIndex, offsetBy: 3) // index of "r"
     ```

3. Index & Range & Subscript 

   subscript ```[]```  와 ```String.Index``` 를 사용해서 ```Substring```을 구할 수 있다.

   ```swift
   let sample = "Fake it till you make it"
   
   let third = sample.index(sample.startIndex, offsetBy: 2) 
   //index of "k"
   let indexL = sample.index(of: "l") 
   // return first index of "l"
   
   let sub: Substring = sample[third..<fifth]
   // "ke it ti"
   // String으로 바꾸고 싶으면 String initializer 사용 가능 (ex. String(substringVariable))
   ```

&nbsp;

### 좌표상에 점 찍는 순서

1. 좌표 출력

2. 점 찍기

3. :star: **원점으로 cursor 움직이기**

   원점으로 cursor를 원복시키지 않으면 terminal 에서 점 찍은 위치 아래의 텍스트는 사라지게 된다.
   (원점의 위치는 좌표에서 0이 출력되는 위치로 세팅함)

&nbsp;

### 좌표 상 점의 위치 구하기

- **_row == y, col == x_** 임에 유의

  ```swift
  col = point.x * 2 + 3
  ```

  - String에서 문자 2개가 한칸으로 표현되므로 두배
  - 가로 한 줄에서 왼쪽 3칸은 y축 & 숫자

  ```swift
  row = ANSICode.axis.AxisLimit - point.y + 1
  ```

  - y축 위치는 상단 왼쪽 위가 (0,0)
  - 따라서, 출력되는 좌표에서 y값이 작을수록, 반대로 row에 들어갈 값은 커져야 함
  - x축(y가 0일 때)은 좌표에서 25번째 줄에 출력됨 (max값 + 1)

&nbsp;

&nbsp;

## :pushpin: Step 5-3

### CharacterSet 

> A set of Unicode character values for use in search operations. ([documentation](<https://developer.apple.com/documentation/foundation/characterset>))

- 사용 목적: 
  to group characters together **_for searching operations_**, so that they can **_find any of a particular set of characters during a search._**
  검색을 위한 character를 한 그룹에 모아 검색 관련 method를 내장
- 특징
  - standard character set 제공 - type property로 제공함(static var)
  - :star: 검색에 유용한 method (Combining Character Set)
    - 집합 관련 method로 두개의 CharacterSet간의 비교가능 : union, subset, superset..
    - isSuperset , isSubset
  - insert() : characterset 요소 추가
  - String으로 초기화 가능 : init(charactersIn: String) 

- 구현) 입력 String에 입력할 수 없는 문자가 포함되어있는지 체크하기

  - Standard: 입력가능한 문자만 있는 set -> 괄호, 쉼표, 숫자만(음수, 소수 안됨)
  - ``` validCharacterSet.isSuperset(of: inputCharacterSet)``` : 체크하는 핵심 메소드

  ```swift
  //입력 가능한 문자만 있는 set
  var validCharacterSet: CharacterSet = CharacterSet(charactersIn: "(,)")
  // forUnion: Sets the value to a union of the CharacterSet with another CharacterSet.
  // 합집합. 합치기 with decimalDigits
  validCharacterSet.formUnion(CharacterSet.decimalDigits)
  
  // standard와 비교할 입력 받은 문자열
  let inputCharacterSet = CharacterSet(charactersIn: "(10,11)")
  
  // 기준에 입력받은 문자열이 완전히 포함되는지 -> true
  validCharacterSet.isSuperset(of: inputCharacterSet)
  // 입력받은 문자열이 기준에 완전히 포함되는 부분집합인지 -> true
  inputCharacterSet.isSubset(of: validCharacterSet)
  
  // ** 허점 발생! 괄호가 없거나, 쉼표가 없어도 true로 인식됨
  let invalidCharacterSet = CharacterSet(charactersIn: "11,11")
  invalidCharacterSet.isSubset(of: validCharacterSet)
  
  ```

  - 문제점 보완 : 괄호, 쉼표, 숫자를 점점 추가해가며 비교

  ```swift
  let inputCharacterSet = CharacterSet(charactersIn: "(10,11)")
  let invalidCharacterSet = CharacterSet(charactersIn: "11,10")
  
  //1. parenthesis
  var validCharacterSet = CharacterSet(charactersIn: "()")
  validCharacterSet.isSubset(of: inputCharacterSet)   // true
  validCharacterSet.isSubset(of: invalidCharacterSet) // false
  
  //2. comma
  validCharacterSet.formUnion(CharacterSet(charactersIn: ","))
  validCharacterSet.isSubset(of: inputCharacterSet)   //true
  validCharacterSet.isSubset(of: invalidCharacterSet) //false
  
  //3. decimalDigits
  validCharacterSet.formUnion(CharacterSet.decimalDigits)
  validCharacterSet.isSuperset(of: inputCharacterSet)   //true
  validCharacterSet.isSuperset(of: invalidCharacterSet) //true
  ```

  - 참고) strictSubset / strictSuperSet 은 **해당 set과 동일한건 불포함임**

    - ex. {a, b}에서 {a}, {b}는 strictSubset. {a, b}는 불포함

  - standard character set 중 ```decimalDigits``` : **0 포함. 음수 불포함**

    ```swift
    let zero = CharacterSet(charactersIn: "0")
    let negative = CharacterSet(charactersIn: "-1")
    CharacterSet.decimalDigits.isSuperset(of: zero)
    CharacterSet.decimalDigits.isSuperset(of: negative)
    ```
  

&nbsp;

> reference : [Understanding Swift's CharacterSet](<https://medium.com/livefront/understanding-swifts-characterset-5a7a89a32b54>)

&nbsp;

### Function vs Computed Property - What to use

- function 
  - 여러번 호출시 마다 다른 값의 결과가 나올 것으로 예상될 때
  - error 발생 가능성이 있을 때
  - heavy
  - complexity가 클 때
- computed property
  - when computation is cheap 
  - complexity 가 O(1)일 때
  - error 발생 가능성이 없음
- ValueComputable 의 description
  - 여러번 호출 되어도 항상 같은 값을 내보낼 것 → computed property 가 적절할 것으로 판단

- reference
  - [function vs computed property - what to use](https://medium.com/swift-india/functions-vs-computed-property-what-to-use-64bbe2df3916)

