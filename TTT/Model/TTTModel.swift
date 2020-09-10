//
//  TTTModel.swift
//  TTT
//
//  Created by cate on 1/23/19.
//  Copyright © 2019 Sean Zhan. All rights reserved.
//

import Foundation

struct Game {
    //this game will ultimately work for boards of any dimension when I have time to learn how to use UICollectionViewController to set up game boards
    var numOfClicks = 0
    var isCross = false
    var numOfCrossWins = 0
    var numOfCircleWins = 0
    var index = 0
    var count = 0
    var crossIsWinner = false
    var circleIsWinner = false
    var alertMessage = ""
    
    //this dictionary stores four arrays of x and y values for coordinates.
    var coordinates : [String : [Int]] = [
        "crossX" : [Int](),
        "crossY" : [Int](),
        "circleX" : [Int](),
        "circleY" : [Int]()
    ]
    
    var countOfSameValues = [Int: Int]()
    
    mutating func checkCrossWinner() {
        if count == 3 {
            print("Cross is the winner!")
            alertMessage = "Cross is the winner!"
            numOfCrossWins += 1
            crossIsWinner = true
        }
        index += 1
    }
    
    mutating func checkCircleWinner() {
        if count == 3 {
            print("Circle is the winner!")
            alertMessage = "Circle is the winner!"
            numOfCircleWins += 1
            circleIsWinner = true
        }
        index += 1
    }
    
    mutating func checkWinner() {
        //a straight line (except for diagonals) means that either array in the four arrays must contain three of the same values
        for (keys, arrays) in coordinates {
            for value in arrays {
                //looping through each array in coordinates dictionary and put the number of occurrence of coordiantes in countOfSameValues
                countOfSameValues[value, default: 0] += 1
                for (_, freq) in countOfSameValues {
                    //if the same number shows up three times, we know that either cross or circle has completed a straightline (except for diagnols)
                    if freq == 3 {
                        print(keys)
                        //now we just need to determine which of the four arrays coordinates three of the same values. Conveniently, cross contains character or while circle contains character i.
                        let cross = keys.characters.contains("o")
                        if cross == true {
                            print("Cross is the winner!")
                            numOfCrossWins += 1
                            crossIsWinner = true
                        } else {
                            print("Circle is the winner!")
                            numOfCircleWins += 1
                            circleIsWinner = true
                        }
                    }
                }
            }
            //remember to reset countOfSameValues because the code needs to check other arrays in the coordiantes dictionary
            countOfSameValues.removeAll()
        }
        
        //there are two cases for checking diagonals. Case 1: the x and y values of the same coordinate must be the same, and this needs to happen three times. Case 2: the x and y values of the same coordinate must add up to (dimension - 1), and this needs to happen three times as well.
        //Check Case 1 for cross
        for item in coordinates["crossX"] ?? [] {
            if item == coordinates["crossY"]?[index] {
                count += 1
            }
            checkCrossWinner()
        }
        count = 0
        index = 0
        
        //Check Case 2 for cross
        for item in coordinates["crossX"] ?? [] {
            //the number 2 in the if statement below is actually 3 - 1. If the dimension (n) is greater, the value would be changed to n - 1
            if item + (coordinates["crossY"]?[index])! == 2 {
                count += 1
                
            }
            checkCrossWinner()
        }
        count = 0
        index = 0
        
        //Check Case 1 for circle
        for item in coordinates["circleX"] ?? [] {
            if item == coordinates["circleY"]?[index] {
                count += 1
            }
            checkCircleWinner()
        }
        count = 0
        index = 0
        
        //check Case 2 for circle
        for item in coordinates["circleX"] ?? [] {
            //the number 2 in the if statement below is actually 3 - 1. If the dimension (n) is greater, the value would be changed to n - 1
            if item + (coordinates["circleY"]?[index])! == 2 {
                count += 1
                
            }
            checkCircleWinner()
        }
        count = 0
        index = 0
    }
    
    
    
}


