//
//  File.swift
//  tictactoe
//
//  Created by cate on 1/16/19.
//  Copyright © 2019 Sean Zhan. All rights reserved.
//

import Foundation

struct Game {
    
    var numOfClicks = 0
    var isCross = false
    var numOfCrossWins = 0
    var numOfCircleWins = 0

    var coordinates : [String : [Int]] = [
        "crossX" : [Int](),
        "crossY" : [Int](),
        "circleX" : [Int](),
        "circleY" : [Int]()
    ]
    
    var countOfSameValues = [Int: Int]()
    
    mutating func checkWinner() {
        //a straight line (except for diagonals) means that either of the four arrays in coordinates dictionary must contain three of the same values
        for (keys, arrays) in coordinates {
            for value in arrays {
                //looping through each array in coordinates dictionary and put the number of occurrence of coordiantes in countOfSameValues
                countOfSameValues[value, default: 0] += 1
                for (_, freq) in countOfSameValues {
                    //if the same number shows up three times, we know that either cross or circle has completed a straightline (except for diagnols)
                    if freq == 3 {
                        print(keys)
                        //now we just need to determine in which of the four arrays that  coordinate value shows up three times. Conveniently, cross contains character o while circle contains character i.
                        let cross = keys.characters.contains("o")
                        if cross == true {
                            print("Cross is the winner!")
                            numOfCrossWins += 1
                        } else {
                            print("Circle is the winner!")
                            numOfCircleWins += 1
                        }
                    }
                }
            }
            //remember to reset countOfSameValues because the code needs to check other arrays in the coordiantes dictionary
            countOfSameValues.removeAll()
        }
        
        //special case: diagonals. A diagnol means that both the x coordiantes and the y coordinates must contain three of the same values
        //the shenanigans in the below few lines are to compare the x and y coordinates array from cross and circle.
        let crossDiagonal = Array(Set(coordinates["crossX"]!.filter() {coordinates["crossY"]!.contains($0)}))
        let circleDiagonal = Array(Set(coordinates["circleX"]!.filter() {coordinates["circleY"]!.contains($0)}))
        //we need to make sure that either array must have at least three values to win a three-by-three tictactoe. corssDiagonal.count == 3 makes sure that there are exactly three of the same values.
        if coordinates["crossX"]!.count >= 3 && crossDiagonal.count == 3 {
            print("Cross is the winner!")
            numOfCrossWins += 1
        }
        if coordinates["circleX"]!.count >= 3 && circleDiagonal.count == 3 {
            print("Circle is the winner")
            numOfCircleWins += 1
        }
    }
    
}

//here's the extension that enables us to compare arrays.
extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}



