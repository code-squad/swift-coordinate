# DTO, VO

- DTO는 VO와 같은 것으로 보기도 하지만 차이점이 존재한다.
- DTO를 사용함으로써 데이터를 효과적으로 격리할 수 있다.

## DTO (Data Transfer Object)

- 데이터 전송을 위한 객체

- 데이터를 오브젝트로 변환하는 객체

- 같은 시스템에서 사용되는 것이 아닌 다른 시스템으로 전달하는 작업을 처리하는 객체

- 메소드 호출 횟수를 줄이기 위해 데이터를 담고 있는 것

- 로직을 가지지 않는 순수한 데이터 객체

- VO + set 으로 볼 수 있다.

- 가변성

- DTO 사용 예시

  ```swift
  struct LadderGame {
  	private var players = [LadderPlayer]
  	private var ladder = [[LadderStep]]
  
    								.
  									.
  									.
  	
  	/// LadderGameDTO 구조체로 데이터를 변환해주는 함수
  	func translateToDTO() -> LadderGameDTO{
  				// 기타 구문들...
  				// LadderGameDTO 구조체로 데이터를 넘김
          let ladderGameDTO = LadderGameDTO(names: playerNames,
                                            ladder: buildLadder)
          return ladderGameDTO
      }
  }
  // 데이터를 담고 있는 객체(DTO)
  struct LadderGameDTO {
      var names = [String]
      var ladder = [[LadderStep]]  
  }
  
  struct OutputView {
  	func printResult(_ ladder : LadderGameDTO) {
  		// LadderGameDTO 구조체에서 받은 데이터들을 활용한 출력 구문
  	}
  }
  ```

  

  

## VO (Value Object)

- 값을 위해 사용하는 오브젝트

- 읽기를 하기 위해서 사용하는 객체

- 간단한 독립체를 의미하는 작은 객체를 의미

- 사용 되는 값이 객체로 표현

- 값이 같으면 동일한 오브젝트라고 볼 수 있음

- 불변성

  