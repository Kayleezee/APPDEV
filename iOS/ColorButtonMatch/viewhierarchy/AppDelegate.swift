//
//  ColorWord.swift
//  viewhierarchy
//
//  Created by Klaus Naumann on 5/17/15.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var scoreLabel: UILabel!
    var colorButtons = [ColorButton]()
    
    var timer: NSTimer?
    
    var rounds = 0
    var score = 0 {
        didSet {
            self.updateScoreLabel()
        }
    }
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //: init window
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        
        self.window = window
        
        //: init scorelabel
        let scoreLabel = UILabel()
        
        scoreLabel.backgroundColor = UIColor.clearColor()
        scoreLabel.frame = CGRect(x: 10, y: 10, width: window.frame.size.width - 10, height:40)
        window.addSubview(scoreLabel)
        
        self.scoreLabel = scoreLabel
        
        //: game logic
        addColorButton()
        addColorButton()
        
        self.updateScoreLabel()
        self.prepareNextRound()
        
        return true
    }
    
    func addColorButton() {
        let button = ColorButton()
        
        button.colorWord = ColorWord()
        button.addTarget(self, action: "colorButtonPressed:", forControlEvents: .TouchUpInside)
        button.frame = CGRect(x: window!.frame.size.width / 2 - 40, y: 20 + 64 * CGFloat(colorButtons.count), width: 80, height: 44)
        
        self.window?.addSubview(button)
        self.colorButtons.append(button)
    }
    
    func timerFired(timer: NSTimer) {
        for button in self.colorButtons {
            if button.colorWord.isCorrect {
                self.score += 0
            }
        }
        prepareNextRound()
    }
    
    func prepareNextRound() {
        self.rounds++
        
        if self.rounds > self.colorButtons.count * 2 && self.colorButtons.count < 7 {
            addColorButton()
        }
        
        for button in self.colorButtons {
            button.colorWord = ColorWord()
        }
        
        if let timer = self.timer {
            timer.invalidate()
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(max(2, 5 - 0.1 * Double(self.rounds)), target: self, selector: "timerFired:", userInfo: nil, repeats: false)
        
    }
    
    func colorButtonPressed(sender: ColorButton) {
        if sender.colorWord.isCorrect {
            score += 1
        } else {
            score -= 3
        }
        prepareNextRound()
    }
    
    func updateScoreLabel() {
        self.scoreLabel.text = "Score: \(score)"
    }


}

