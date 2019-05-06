

# STEP-2

## joined

`joined(separator: String = "") -> String`

```swift
 let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let list = cast.joined(separator: ", ")
    ///     print(list)
    ///     // Prints "Vivien, Marlon, Kim, Karl"
```

시퀀스의 엘레먼츠를 연결하여 새 문자열을 반환하고, 각 요소 사이에 주어진 구분 기호를 추가한다. 

위의 예제에서는 문자열 배열을 쉼표로 구분된 하나의 문자열로 결합하고 있습니다.

```swift
let input = prompt.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
//[String]을 String으로 변환한다.
```





## Set

Set은 말 그대로 집합입니다. set은 콜렉션에서 동일한 유형의 겹치지 않는 고유한 값을 저장합니다. 순서는 정의 되지 않습니다. 

항목의 순서가 중요하지 않거나 항목을 한 번만 표시해야 하는 경우 배열 대신 집합을 사용할 수 있습니다.

 

#### 빈 Set 생성하고 초기화하기

```swift
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."

letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>
```

이미 입력된 변수나 상수와 같은 타입 정보를 제공하는 경우 빈 배열 리터럴을 사용하여 빈 집합을 만들 수 있습니다.

```swift
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
```

 

#### Set에 접근, 변경하기

```swift
/// count(_:)
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."

/// isEmpty(_:)
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

/// insert(_:)
favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items

/// remove(_:)
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."

/// contains(_:)
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."
```

- count(_:) : 집합 원소의 개수
- isEmpty(_:) : 집합이 비어있는지 true / false 로 나타내준다.
- insert(_:) : 원소를 추가한다.
- remove(_:) : 원소를 제거한다.
- contains(_:) : 파라미터에 있는 원소가 집합에 포함되어있는지 true/false 로 나타내준다.

#### Set Iterating

```swift
for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```

for-in  루프를 사용해 집합 내 원소들을 반복할 수 있다.

sorted() 를 사용하면 < 연산자를 사용하여 정렬 된 배열로 반환한다.

 

#### Set 명령어

Set는 기본적인 집합 연산을 할 수 있습니다.



![img](https://k.kakaocdn.net/dn/chyVY5/btquJGexvWd/OzwV1Kud4tDFp2qKgUNNv0/img.png)



- intersection(_:) 메서드는집합 a와 b의 교집합 부분을 새로운 Set로 만들어줍니다. (A∩B)
- symmetricDifference(_:) 메서드는 a와 b 두 집합 중 하나의 집합에 속하는 값만을 새로운 Set로 만들어줍니다. (A∪B) - (A∩B) 
- union(_:) 메서드는 a와 b 두 집합의 모든 값을 새로운 Set로 만들어줍니다. (A∪B)
- subtracting(_:) 메서드는 지정된 집합에 없는 값을 새로운 Set로 만들어줍니다. (A-B)

```
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
```

 

#### Set의 멤버십, 동등 비교



![img](../files/README.assets/img-20190430173431084.png)



 

== 연산자를 사용하여 두 집합의 값이 모두 같은지 확인한다.

isSubset(of:) 메서드를 사용하여 집합의 모든 값이 특정 집합에 속하는지 확인한다.

isSuperset(of:) 메서드를 사용하여 집합이 특정 집합의 모든 값을 갖고 있는지 확인한다.

isStrictSubset(of:) 또는 isStrictSuperset(of:) 메서드를 사용하여 특정 집합과 같지는 않지만 그 집합의 서브셋인지 슈퍼셋인지를 확인한다.

 isDisjoint(with:) 메서드를 사용하여 두 개의 집합이 공통된 값이 없는지 확인한다.

```swift
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
```



# STEP-3

## flatMap

중첩 배열 풀기 

```swift
let nestedItems = [ [1, 2, 3], [4, 5, 6] ]
let flattenNested = nestedItems.flatMap { $0 }
flattenNested
// [1, 2, 3, 4, 5, 6]
```



#STEP-4

## 객체 설계 - 캡슐화

#### 캡슐화

객체의 필드(속성), 메소드를 하나로 묶고, 실제 구현 내용을 외부에 감추는 것을 말한다.

외부 객체는 객체 내부의 구조를 얻지 못하며 객체가 노출해서 제공하는 필드와 메소드만 이용할 수 있다.

캡슐화된 멤버를 노출시킬 것인지 숨길 것인지를 결정하기 위해 접근 제한자(Access Modifier)를 사용한다.

**캡슐화의 장점**

- 외부의 잘못된 사용으로 인해 객체가 손상되지 않도록 하는데 있다.

- 요구사항이 변경되어 해당 기능을 변경해야 할 때, 클래스를 사용하는 코드에 영향을 주지 않고 그 클래스를 변경할 수 있다. 사이드 이펙트가 줄어들기 때문에 캡슐화 된 코드의 수정이 쉽다.



#### 접근 제한자

![Swift 접근제어자](https://k.kakaocdn.net/dn/sPWjd/btqu14zu8aN/6NkXsYJCzYjaaaAxaX7BE0/img.png)

**private**은 정말 나(구조체 내부에서)만 할 수 있게 만든 것이다. 외부에 공유를 하고 싶지 않다. 읽지도 쓰지도 못하게 하고 싶다. 그러면 private을 사용하면 된다. 

**fileprivate**은 나랑 같은 파일 안에 있는 애들한테만 공개를 하고 싶다면 사용하면 된다.

**internal**은 우리가 접근제어자를 사용해 주지 않을 때 기본으로 사용되는 값이다. 앱의 어떤 위치에서도 사용할 수 있다.

**public, open**은 모듈 밖에서도 접근을 할 수 있다. 

여기서 **module**은 타깃이나 앱을 말한다.



참조: 

https://webclub.tistory.com/156

