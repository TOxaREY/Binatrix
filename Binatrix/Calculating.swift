//
//  Calculating.swift
//  BN
//
//  Created by REYNIKOV ANTON on 29.09.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation
class CalculatingBinary {
    private var _decimalNumber:Double = 0.0
    private var _binaryNumberString:String = ""
    private var _binaryNumberResidueString:String = ""
    var decimalNumber:Double {
        get {
            return _decimalNumber
        } set {
            _decimalNumber = newValue
        }
    }
    var binaryNumberString:String {
        get {
            return _binaryNumberString
        } set {
            _binaryNumberString = newValue
        }
    }
    var binaryNumberResidueString:String {
        get {
            return _binaryNumberResidueString
        } set {
            _binaryNumberResidueString = newValue
        }
    }
    func calculatingBinary() {
        var moduloDecimalNumber:Int64 = 0
        var binaryNumberArray = [Int]()
        var resultDivisionByTwo:Double = 0.0
        var binaryNumber = [Int]()
        var decNumb:Double = 0.0
        decNumb = decimalNumber
        var decNumbRes:Double = 0.0
        var decNumbRes2:Double = 0.0
        var countResidue:Int = 0
        var multicplicationDecNumRes:Double = 0.0
        var binaryNumberArrayResidue = [Int]()
        var i = 0
        while decimalNumber != 0 {
            moduloDecimalNumber = Int64(decimalNumber) % 2
            binaryNumberArray.append(Int(moduloDecimalNumber))
            func modulo() -> (Double) {
                if moduloDecimalNumber == 0 {
                    return 0
                }
                return 0.5
            }
            resultDivisionByTwo = Double(Int64(decimalNumber)) / 2 - modulo()
            decimalNumber = resultDivisionByTwo
        }
        binaryNumber = binaryNumberArray.reversed()
        binaryNumberString = binaryNumber.compactMap{String($0)}.joined()
        binaryNumberArray.removeAll()
        //residue
        countResidue = 50 - binaryNumberString.count
        decNumbRes = decNumb - Double(Int64(decNumb))
        decNumbRes2 = decNumbRes
        if decNumbRes != 0 {
            while i != countResidue && decNumbRes != 0 {
                multicplicationDecNumRes = decNumbRes * 2
                binaryNumberArrayResidue.append(Int(multicplicationDecNumRes))
                decNumbRes = multicplicationDecNumRes
                if decNumbRes >= 1 {
                    decNumbRes -= 1
                }
                i += 1
            }
        }
        if decNumbRes2 == 0 {
            binaryNumberResidueString = ""
        } else {
            binaryNumberResidueString = ".\(binaryNumberArrayResidue.compactMap{String($0)}.joined())"
        }
    }
}
class CalculatingDecimal {
    private var _binaryNumber:Double = 0.0
    private var _decimalNumberString:String = ""
    private var _decimalNumberResidueString:String = ""
    private var _decimalNumberDouble:Double = 0.0
    var binaryNumber:Double {
        get { 
            return _binaryNumber
        } set {
            _binaryNumber = newValue
        }
    }
    var decimalNumberString:String {
        get {
            return _decimalNumberString
        } set {
            _decimalNumberString = newValue
        }
    }
    var decimalNumberResidueString:String {
        get {
            return _decimalNumberResidueString
        } set {
            _decimalNumberResidueString = newValue
        }
    }
    var decimalNumberDouble:Double {
        get {
            return _decimalNumberDouble
        } set {
            _decimalNumberDouble = newValue
        }
    }
    func calculatingDecimal() {
        let decimalNumberStringTransform = String(Int64(binaryNumber))
        var decimalNumberArray = [Int64]()
        var decimalNumber:Int64 = 0
        var decimalNumberReside:Double = 0.0
        var biNumbRes:Double = 0.0
        var biNumb:Double = 0.0
        biNumb = binaryNumber
        let binaryNumberFull = String(binaryNumber).compactMap{Int64(String($0))}
        if Int64(binaryNumber) != 0 {
            decimalNumberArray = decimalNumberStringTransform.compactMap{Int64(String($0))}
            for i in 0...decimalNumberArray.count - 1 {
                decimalNumber += decimalNumberArray[i] * Int64(pow(2.0, Double(decimalNumberArray.count - 1 - i)))
            }
        } else {
            decimalNumberArray.removeAll()
        }
        if biNumb == 0 {
            decimalNumberString = ""
        } else {
            decimalNumberString = String(decimalNumber)
        }
        //residue
        biNumbRes = biNumb - Double(Int64(biNumb))
        if biNumbRes != 0 {
            let decimalNumberArrayResidue = binaryNumberFull.dropFirst(decimalNumberStringTransform.count)
            for i in 0...decimalNumberArrayResidue.count - 1 {
                decimalNumberReside += Double(decimalNumberArrayResidue[i + decimalNumberStringTransform.count]) * pow(2.0, Double(1 - 2 - i))
            }
        }
        if biNumbRes == 0 {
            decimalNumberResidueString = ""
        } else {
            decimalNumberResidueString = String(decimalNumberReside)
            decimalNumberResidueString.removeFirst()
        }
        decimalNumberDouble = Double(decimalNumber) + decimalNumberReside
    }
}




