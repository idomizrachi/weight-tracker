//
//  WeightInput.swift
//  weight
//
//  Created by Ido Mizrachi on 16/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit

class WeightDisplay {
    var wholeValue: UInt = 0
    var fractionValue: UInt = 0
    var isTypingDecimalPart = false
    
    public func add(digit: UInt) {
        if self.isTypingDecimalPart {
            addFraction(digit: digit)
        } else {
            addWhole(digit: digit)
        }
    }
    
    private func addWhole(digit: UInt) {
        wholeValue *= 10
        wholeValue += digit
    }
    
    private func addFraction(digit: UInt) {
        fractionValue *= 10
        fractionValue += digit
    }
    
    public func addFraction() {
        isTypingDecimalPart = true
    }
    
    public func clear() {
        self.isTypingDecimalPart = false
        wholeValue = 0
        fractionValue = 0
    }
    
    public func stringValue() -> String {
        var stringValue = "\(wholeValue)"
        if fractionValue > 0 {
            stringValue += ".\(fractionValue)"
        }
        return stringValue
    }
    
    public func decimalValue() -> Double {
        return Double(wholeValue) + Double(Double(fractionValue) / pow(10, Double(numberOfDigitsIn(number: fractionValue))))
    }
    
    public func set(value: Double) {
        self.clear()
        let whole = floor(value)
        let fraction = value - whole
        self.wholeValue = UInt(whole)
        self.fractionValue = fractionToInt(fraction, maxDigits: 2)
    }
    
    private func numberOfDigitsIn(number: UInt) -> UInt {
        var mutableNumber = number
        var numberOfDigits = 0
        while mutableNumber > 0 {
            numberOfDigits += 1
            mutableNumber /= 10
        }
        return UInt(numberOfDigits)
    }
    
    private func fractionToInt(_ fraction: Double, maxDigits: UInt) -> UInt {
        var result: UInt = 0
        var mutableWhole = floor(fraction)
        var mutableFraction = fraction - mutableWhole
        while mutableFraction > 0 && numberOfDigitsIn(number: result) < maxDigits {
            result *= 10
            result += UInt(floor(mutableFraction * 10))
            mutableFraction *= 10
            mutableWhole = floor(mutableFraction)
            mutableFraction = mutableFraction - mutableWhole
        }
        return UInt(result)
    }
}
