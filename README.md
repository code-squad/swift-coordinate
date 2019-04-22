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



![img](../files/README.assets/img-20190422194534590.png)



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



![img](../files/README.assets/img.png)



 

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



----

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