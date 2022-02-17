//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var userInputNumbers: [Int] = []
var remainingChangeCount: Int = 9
var strikeCounting = 0
var (strikeCount, ballCount) = (Int.zero, Int.zero)
let endGameCount = 3
let computerNumbers = generateRandomNumbers()

func playGame() {
    let chanceCount = 1
    
    while remainingChangeCount > .zero {
        guard isHaveVerifiedNumbers(receiveUserInputNumbers()) else {
            playGame()
            return
        }
        calculateStrikeBallWith(userInputNumbers, and: computerNumbers)
        remainingChangeCount -= chanceCount
        printPlayingGameMessage()
        resetStrikeBallCount()
       if  strikeCounting >= 3  {break}
        
    }
    judgeGameResult()
}

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func selectMenu() {
    printMenu()
    guard let inputNumbers: String = readLine()?.replacingOccurrences(of: " ", with: "") else { return }
    
    switch inputNumbers {
    case "1":
        playGame()
        selectMenu()
    case "2":
       break
    default:
        print("입력이 잘못되었습니다.")
        selectMenu()
    }
}

func printInputGuidence() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func receiveUserInputNumbers() -> [String]? {
    printInputGuidence()
    let inputNumbers = readLine()?.components(separatedBy: " ")
    return inputNumbers
}

func generateRandomNumbers(range: ClosedRange<Int> = 1...9, numbersCount: Int = 3) -> Array<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < numbersCount {
        randomNumbers.insert(Int.random(in: range))
    }
    return Array(randomNumbers)
}

func increaseStrikeCount(_ userNumbers: [Int], and computerNumbers: [Int])  {
    let strikePoint = 1
    for index in userNumbers.indices {
        strikeCount += userNumbers[index] == computerNumbers[index] ? strikePoint : .zero
    }
}

func increaseBallCount(_ userNumbers: [Int], and computerNumbers: [Int]) {
    ballCount = (Set(computerNumbers).intersection(userNumbers).count - strikeCount)
}

func calculateStrikeBallWith(_ userNumbers: [Int], and computerNumbers: [Int]) {
    increaseStrikeCount(userNumbers, and: computerNumbers)
    increaseBallCount(userNumbers, and: computerNumbers)
    strikeCounting += strikeCount
}

func resetStrikeBallCount() {
    strikeCount = .zero
    ballCount = .zero
}

func saveConvertedNumbers(_ numbers: [String]?) {
    if let verifiedNumber = numbers?.compactMap({ Int($0) }) {
        userInputNumbers = verifiedNumber
    }
}

func isNumber(numbers: [String]?) -> Bool {
    guard let verifiedNumber = numbers?.compactMap({ Int($0) }),
          verifiedNumber.count == 3 else {
              return false
          }
    saveConvertedNumbers(numbers)
    return true
}

func isHaveInRange(numbers: [Int], range: ClosedRange<Int> = 1...9) -> Bool {
    return numbers.filter { range.contains($0) }.count == 3
}

func isHaveDuplication(numbers: [Int]) -> Bool {
    return Set(numbers).count == 3
}

func isHaveVerifiedNumbers(_ numbers: [String]?) -> Bool {
    return isNumber(numbers: numbers) && isHaveInRange(numbers: userInputNumbers) && isHaveDuplication(numbers: userInputNumbers)
    
}

func printPlayingGameMessage() {
    let (strikeDescription, ballDescription) =  ("스트라이크," ,"볼")
    let remainingChanceDescription: String = "남은 기회 :"
    
    print("\(strikeCount)\(strikeDescription) \(ballCount) \(ballDescription) ")
    print("\(remainingChanceDescription) \(remainingChangeCount)")
}

func judgeGameResult() {
    let (userWin, computerWin) = ("사용자의 승리...!", "컴퓨터의 승리...!")
    print(remainingChangeCount == .zero ? computerWin : userWin)
}
selectMenu()
