//
//  MathOperations.swift
//  LearningXCodeSwift
//
//  Created by Megha Salvi on 5/31/23.
//

import Foundation
import SwiftUI

class Game {
    
    private var difficulty:Int
    private var operation:String
    private var problem:[Int]
    private var digits:[[Int]]
    private var carryDigits:[Int]
    private var answerDigits:[Int]
    
    //default constructor sets difficulty to 1 and operation to "Addition"
    init () {
        self.difficulty = 1
        self.operation = "Addition"
        self.problem = [1, 2]
        self.digits = [[Int]]()
        self.carryDigits = Array(repeating: 0, count: difficulty)
        self.answerDigits = Array(repeating: 0, count: difficulty + 1)
        
        self.digits = createDigitsArray()
        createCarryAndAnswerArrays()
    }
    
    //non-default construct sets difficulty and operation to provided inputs
    init(difficulty: Int, operation: String) {
        self.difficulty = difficulty
        self.operation = operation
        self.problem = [1, 2]
        self.digits = [[Int]]()
        self.carryDigits = [Int]() //size should be difficulty
        self.answerDigits = [Int]() //size should be difficulty - 1
        
        self.problem = generateProblem()
        self.digits = createDigitsArray()
        createCarryAndAnswerArrays()
    }
    
    //getters
    public func getDifficulty() -> Int {
        return difficulty
    }
    
    public func getOperation() -> String {
        return operation
    }
    
    public func getProblem() -> [Int] {
        return self.problem
    }
    
    public func getDigits() -> [[Int]] {
        return self.digits
    }
    
    public func getCarryDigits() -> [Int] {
        return self.carryDigits
    }
    
    public func getAnswerDigits() -> [Int] {
        return self.answerDigits
    }
    
    
    
    public func numToDigits(num:Int) -> [Int] {
        var digits:[Int] = [Int]()
        var digitTracker:Int = num
        repeat {
            digits.insert(digitTracker%10, at: 0)
            digitTracker /= 10
        } while (digitTracker != 0)
        return digits
    }
    
    func createDigitsArray() -> [[Int]] {
        var digitsArray = [[Int]]()
        for num in problem {
            digitsArray.append(numToDigits(num: num))
        }
        return digitsArray
    }
    
    public func generateProblem() -> [Int] {
        var firstNum:Int, secondNum:Int
        var problem:[Int] = [Int](repeating: 0, count: 2)
        
        let maxNum:Int = (pow(10, difficulty) as NSDecimalNumber).intValue
        let minNum:Int = (pow(10, difficulty-1) as NSDecimalNumber).intValue
        
        repeat {
            firstNum = Int.random(in: minNum..<maxNum)
            secondNum = Int.random(in: minNum..<maxNum)
        } while firstNum < secondNum
        
        problem[0] = firstNum
        problem[1] = secondNum
        return problem
    }
    
    public func createCarryAndAnswerArrays() {
        var firstNumCopy:Int = problem[0], secondNumCopy:Int = problem[1], carryDigit:Int = 0
        
        while (firstNumCopy != 0 || secondNumCopy != 0) {
            let firstNumDigit = firstNumCopy%10, secondNumDigit = secondNumCopy%10, currDigit = (firstNumDigit + secondNumDigit)%10 + carryDigit
            answerDigits.insert(currDigit, at: 0)
            carryDigit = (firstNumDigit + secondNumDigit + carryDigit)/10
            carryDigits.insert(carryDigit, at: 0)
            
            firstNumCopy /= 10
            secondNumCopy /= 10
            
            if (firstNumCopy == 0 || secondNumCopy == 0) {
                answerDigits.insert(carryDigits[0], at: 0)
            }
        }
    }
    
    public func getTextColor(value:String, correctValue:Int) -> Color {
            let intValue = Int(value) ?? -1
           if intValue == correctValue {
               return .green // Red color if input is less than 5 characters
           } else {
               return .red // Green color if input is 5 or more characters
           }
    }
    
    public func userAnswerCorrect(onesString:String, tensString:String, hundredsString:String, thousandsString:String, correctAnswer:Int, onesRemainderString:String, tensRemainderString:String, correctRemainderOne:Int, correctRemainderTen:Int) -> Bool {
        let ones = Int(onesString) ?? -1
        let tens = Int(tensString) ?? -1
        let hundreds = Int(hundredsString) ?? -1
        let thousands = Int(thousandsString) ?? -1
        let onesRemainder = Int(onesRemainderString) ?? -1
        let tensRemainder = Int(tensRemainderString) ?? -1
        
        let userAnswer = ones + (10*tens) + (100*hundreds) + (1000*thousands)
        
        return userAnswer == correctAnswer && onesRemainder == correctRemainderOne && tensRemainder == correctRemainderTen
    }
   
}
