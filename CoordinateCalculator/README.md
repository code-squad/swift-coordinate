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

## 📌 Step 5-4

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

&nbsp;

### swift math 관련 함수

- pow
- sqrt



&nbsp;

## 📌 Step 5-5

### 추가 구현사항

1. 직사각형만 허용하도록 검사 - 사다리꼴, 마름모 불가
   - 4개 쌍 좌표에서 x, y좌표 값이 각 2가지만 나와야 함
   - x, y값이 같으면 사각형 아님
2. 사각형의 넓이  - size 사용하기

```swift
struct MyRect {
  var leftTop = MyPoint()
  var rightBottom = MyPoint()
  init(origin: MyPoint, size: CGSize) {
        //로직구현
    }
}
```

- CGSize : width, height를 property로 갖는 struct

&nbsp;

### Set 

> An unordered collection of unique elements

중복 없이 unique한 요소들로만 구성된 순서 없는 collection

&nbsp;

```swift
struct Set<Element> where Element : Hashable
```

- generic type 인데, type 중에 Hashable protocol을 채택한 타입만 사용이 가능하다는 의미

- 위치
  
- _Foundation > Collections > Set_
  
- 언제 사용할까? (Array < Set 인 경우) 👍

  > You use a set instead of an array when you need to test efficiently for membership and you aren’t concerned with the order of the elements in the collection, or when you need to ensure that each element appears only once in a collection

  - 순서에 상관없이 소속되어 있는지 확인할 때
  - 딱 한번만 나타나도록 확실하게 하고 싶을 때

- method

  - `contains`
  - `==` , `!==` (Equotable 에서 구현된 method)
  - 집합 연산 : union, disjoint, subset… 등등

- Set 을 사용하기 위한 기본 조건 : Set 의 element가 되는 type이 `Hashable` protocol을 준수해야 한다.

&nbsp;

### Hashable

```swift
protocol Hashable
```

> A type that can be hashed into a `Hasher` to produce an integer hash value

- `Hashable` protocol을 준수하는 type

  - Set, Dictionary key로 사용할 수 있는 type 
  - 해당 type은 **integer hash value를 가진다**.

- standard library - Hashable 채택한 type

  - String
  - integer
  - floating-point
  - boolean .. etc

- hash value가 필요한 이유 : ✅ **instance를 판별하고 구분하고 비교하기 위해서**

  - Hashable ⇢ Equatable : Equatable protocol을 상속받음

    - Equatable protocol : a type that can be compared for value equality

      value가 일치/불일치 하는지 `==`, `!==` operator로 비교할 수 있는 type

    - Hahable은 이런 Equatable 을 상속받았으므로 value간 비교가 가능해야 한다

    - 비교 대상은 hash value가 된다.

  - Set, Dictionary 의 경우, 순서가 없기 때문에 각 element를 identify 할 수 있는 방법이 필요 → `hashValue`

  - 각기 다른 instance 마다 고유한 hash value를 갖도록 Hashable 에서 구현 → `hash(into:)`

- **'Hashing a value (값을 해싱한다)'** 의 의미

  - 해당 type의 **essential components**(결정적인 부분, 남과 다름을 identify 할 수 있는 부분)을 hash function에 넣는다 (Hasher type 사용)
  - essential components는 Equatable 의 구현에서 사용된 부분이다. (비교를 위해서 사용되는 부분)

- Hashable protocol - `hash(into: )` 에서 hash value 만드는 방법: `Hasher` 를 이용

&nbsp;

### Hasher

```swift
struct Hasher
```

> The universal hash function used by `Set` and `Dictionary`.
>
> `Hasher` can be used **to map an arbitrary sequence of bytes to an integer hash value**. You can feed data to the hasher using a series of calls to mutating `combine` methods. When you’ve finished feeding the hasher, the hash value can be retrieved by calling `finalize()`

- byte sequence → integer hash value로 변환해준다.

- hash value 만드는 방법 : mutating method`combine()` 사용

  - combine으로 넘긴 일련의 인자에서 essential part들을 haser state 에 넣고 섞음
  - 프로그램 한 실행에서 각기 다른 object는 각자 다른 hash value를 가진다.
  - 프로그램 한 실행에서 같은 sequence of byte는 항상 같은 hash value를 가진다.
  - haser는 randomly seed 되므로, 여러 번의 실행에서 hash value는 달라질 수 있다.
  - argument의 type이 Hashable protocol을 conform해야 한다.

- hash value 가져오는 방법: function `finalize()` 사용

  - haser state를 종료하고 hash value를 반환한다.

    > Finalizes the hasher state and returns the hash value.

&nbsp;

- _Example_

  ```swift
  var hasher = Hasher() //mutating method combine()을 사용하려면 var로 선언해야 함
  hasher.combine(0)
  hasher.combine(1)
  print(hasher.finalize())
  // 프로그램 실행 시 마다 hash value가 다름
  ```

  ```swift
  var hasher1 = Hasher() 
  var hasher2 = Hasher() 
  hasher1.combine(1)
  hasher2.combine(1)
  
  // 같은 hash value를 가짐
  print(hasher1.finalize())
  print(hasher2.finalize())
  
  hasher2.combine(3)
  print(hasher2.finalize())
  // 다른 hash value
  ```

&nbsp;

&nbsp;

### Conforming to the Hashable Protocol 

**Custom Type을 Set, Dictionary Key에서 사용하려면, protocol Hashable 을 준수해야 한다.**

> To customize your type’s `Hashable` conformance, to adopt `Hashable` in a type that doesn’t meet the criteria listed above, or to extend an existing type to conform to `Hashable`, implement the `hash(into:)` method in your custom type.

#### Way to Conform Hashable Protocol

**1. 자동으로 따르는 경우**

- struct
  - 모든 stored property가 Hashable 준수하는 경우
- enum
  - With associated value: 해당 value type이 Hashable 준수하는 경우
  - without assiciated value: 선언 없이도 자동으로 Hashable 준수

**2. 직접 conformance를 다뤄야 하는 경우**

- 3가지 경우
  - 1번의 자동 조건을 만족하지 못하는 경우
  - existing type 이 Hashable 을 채택하려는 경우
  - Hashable conformance를 직접 custom 하려는 경우
- 방법 : 해당 type에 `hash(into:)` method 구현
- `hash(into:)` 구현하기
  -  Haser의 `combine(_:)` - argument에 해당 type의 essential component를 넘겨준다.
  - Equatable conformance를 다시 구현하는 것도 권장됨 

- _Example - 좌표 상의 점을 나타내는 struct MyPoint_

  ```swift
  struct MyPoint {
    private(set) var x: Int = 0
    private(set) var y: Int = 0
    
    //.. initializer...
  }
  
  extension MyPoint: Hashable {
    static func ==(lpoint: MyPoint, rpoint: MyPoint) -> Bool {
      return lpoint.x == rpoint.x && lpoint.y == rpoint.y
    }
    
    func hash(into haser: inout Hasher) {
      //using essential components - x, y
      haser.combine(x) 
      haser.combine(y) 
    }
  }
  ```

&nbsp;

### CustomStringConvertible

> CustomStringConvertible protocol can provide their own representation to be used **when converting an instance to a string.**

instance → String으로 변환하면 보일 representation을 지정하는 protocol

&nbsp;

- 사용 될 때 : String initializer 를 이용할 때, 지정한 String으로 변환된다.

  > `String(describing:)` : preferred way to convert an instance of any type to a string

  ```swift
  init<Subject>(describing instance: Subject) where Subject : CustomStringConvertible
  ```

  the initializer creates the string representation of instance 

&nbsp;

#### Conforming to the CustomStringConvertible Protocol

- by implementing **_description_** property (var)

  ```swift
  struct MyPoint {
  	let x: Int, y: Int
  }
  
  extension MyPoint: CustomStringConvertible {
    var description: String {
      return "Point at (\(x), \(y))"
    }
  }
  
  let p = MyPoint(x: 10, y:10)
  print(p)
  // "Point as (10, 10)"
  ```

&nbsp;

&nbsp;

#### String(describing:) 을 사용하는 다른 프로토콜 - TextOutputStreamable protocol

이 프로토콜을 준수하는 type은 이 프로토콜을 준수하는 다른 type에 자신의 value를 write 할 수 있다.

해당 instance의 텍스트로 된 표현(textual representation)을 target (which also conforms to this protocol)에 쓸 수 있다.

```swift
func write<Target>(to target: inout Target) where Target : TextOutputStream
```

&nbsp;



### 계산한 넓이, 길이를 출력하는 방법 생각해보기

1. CustomStringConvertible의 extension으로 넓이, 길이 계산하는 method 추가

   모든 CustomStringConvertible이 ValueComputable 이어야 하는가? → **NO**

2. ValueComputable 가 CustomStringConvertible 을 상속받기

   모든 ValueComputable이 CustomStringConvertible 이어야 하는가? → yes or no..
   could be represented in String.. 
   계산한 value가 해당 instance를 대변, 대표하는 값인가? (Is the computed value the representation of the figure instance??) → Yes?  

3. 도형 구조체에서 ValueComputable, CustomStringConvertible 두개의 프로토콜을 채택하기

   OutputView - printComputedValue 에서 protocol 둘에 대한 각각 처리가 필요

