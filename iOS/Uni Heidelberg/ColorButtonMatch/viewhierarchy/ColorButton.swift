//
//  ColorButton.swift
//  viewhierarchy
//
//  Created by Klaus Naumann on 5/17/15.
//
//

import Foundation
import UIKit

class ColorButton: UIButton {
    var colorWord: ColorWord! {
        didSet {
            self.backgroundColor = colorWord.color
            self.setTitle(colorWord.word, forState: .Normal)
        }
    }
    
    func configureForColorWord(colorWord: ColorWord) {
        self.colorWord = colorWord
    }
}