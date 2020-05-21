//
//  ViewController.swift
//  tictactoe
//
//  Created by cate on 1/16/19.
//  Copyright © 2019 Sean Zhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tiles(_ sender: UIButton) {
        
        game.numOfClicks += 1
        
        //a cross will show up at odd number of clicks; a circle will show up at even number of clicks
        if game.numOfClicks % 2 == 1 {
            game.coordinates["crossX"]!.append(sender.tag % 3)
            game.coordinates["crossY"]!.append(sender.tag / 3)
            //set that image background to cross
        } else if game.numOfClicks % 2 == 0 {
            game.coordinates["circleX"]!.append(sender.tag % 3)
            game.coordinates["circleY"]!.append(sender.tag / 3)
            //set that image background to circle
        }
        
        for button in tilesPressed {
            if button.tag == sender.tag {
                //set background to either circle or cross depending on isCrossed is true or false
                button.isEnabled = false
            }
        }
    
        print(game.coordinates)
        game.checkWinner()
        
    }
    
    @IBOutlet var tilesPressed: [UIButton]!
    
}

