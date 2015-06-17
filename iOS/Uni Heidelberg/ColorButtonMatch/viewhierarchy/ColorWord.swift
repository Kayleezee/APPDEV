//
//  ColorWord.swift
//  viewhierarchy
//
//  Created by Klaus Naumann on 5/17/15.
//
//

import Foundation
import UIKit

struct ColorWord {
    static let colors = [ "Red" : UIColor.redColor(),
                            "Green" : UIColor.greenColor(),
                            "Blue" : UIColor.blueColor() ]
    
    let color: UIColor
    let word: String
    
    init() {
        self.word = ColorWord.colors.keys.array.rndElement()
        self.color = ColorWord.colors.values.array.rndElement()
    }
    
    var isCorrect: Bool {
        if let correctChoice = ColorWord.colors[self.word] {
            return self.color == correctChoice
        } else {
            return false
        }
    }
}

extension Array {
    func rndElement() -> T {
        let rndIndex = Int(arc4random_uniform(UInt32(self.count)))
        return self[rndIndex]
    }
}