## ⛺️iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소
🗓 기간 : 2022.02.08 ~ 2022.02.10(2d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [쿼카](https://github.com/Quokkaaa)

### 게임 규칙

- 컴퓨터가 생성한 임의의 수 세 개와 사용자가 입력한 임의의 수 세 개를 비교하여 위치와 값이 같으면 스트라이크, 숫자만 같으면 볼 입니다.
- 도전 횟수는 9번이며 9번 내로 사용자가 3스트라이크가 되면 사용자의 승리, 3스트라이크를 내지 못하면 컴퓨터의 승리입니다.
- 수의 범위는 1~9이며 중복된 수는 없습니다.

### Flow Chart
<img src = "https://user-images.githubusercontent.com/75601594/153446357-c4c8d3b9-570b-433f-b10b-a9ef7959ace9.jpg" width="300px"> </br>


<img src = "https://i.imgur.com/A6dBZYy.jpg" width="200px"></br>





### Naming
1. `generateRandomNumbers()함수` : 임의의 수 생성
2. `calculateStrikeBallWith() 함수` : 컴퓨터와 사용자 수를 비교하여 스트라이크, 볼을 반환한다.
3. `startGame()함수  : generateRandomNumbers()와 compareNumbers()`를 사용하여 게임을 진행하고 진행상황 및 승리자 메세지를 출력하는 함수 </br>
4. `strikeCount , ballCount`: 스트라이크 와 볼 수

### Step1
1. `generateRandomNumbers: func`  = 겹치지 않는 무작위의 3개의 수를 배열로 생성하여 반환.
2. `calculateStrikeBallWith: func` = 컴퓨터가 생성한 수와 유저의 수를 비교하여 스트라이크와 볼을 반환
3. `playGame :func` = 게임을 시작하는 함수

### 로직구현  
- `generateRandomNumbers() 함수` : 임의의 수 생성한다.
- `calculateStrikeBallWith() 함수` :  컴퓨터와 사용자 수를 비교하여 스트라이크, 볼을 반환한다.
- `playGame() 함수 : generateRandomNumbers()와 calculateStrikeBallWith()`를 사용하여 게임을 진행하고 진행상황 및 승리자 메세지를 출력한다.

### 고민했던점
- 순서도 작성 방법과 기준
- commit 메세지 스타일, body 작성 방법
- 변수 및 함수 네이밍
- 전역변수 선언 지양하기 위해 inout 키워드를 얼마나 사용할지 고민
- 하드코딩을 피하기 위해 변수를 따로 선언하는 방법
- 올바른 범위의 값이 입력되었는지 검증하는 방법
- 스트라이크는 인덱스와 숫자가 같은경우 계산하였는데 볼을 계산할때는 공식문서에 있는 교집합에 대한 'intersection'메서드를 참고하였습니다. 그런데 교집합시 볼과 스트라이크 수가 겹치는 상황이 발생하여 (볼 - 스트라이크) = 찐볼 을 계산하였습니다.
- 페어프로그래밍을 할때, 상대방의 코딩 스타일을 맞춰 서로 잘 어우러지게 함과 가독성을 고민을 많이 했습니다.
- 하드 코딩에 지양하는 코드를 구현 할려고 노력을 많이 했습니다

### 궁금했던 것들
- 페어프로그래밍을 할때 프로젝트 시간을 대략적으로 정하고 지키려고했으나 예상보다 많이 지체가되는 상황이 발생하는데 효율성을 높일 수 있는 조언을 구하고싶어요! 현재는 시간을 딱정해서프로젝트를 하고 있습니다.





