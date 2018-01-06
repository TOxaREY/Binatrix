//
//  ViewController3.swift
//  BN
//
//  Created by REYNIKOV ANTON on 29.09.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit
class ViewController3: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    var calcDecForBinOneTwo = CalculatingDecimal()
    var converDecToBin = CalculatingBinary()
    var biOneDecOne:Double = 0.0
    var biTwoDecTwo:Double = 0.0
    var stringMinus:String = ""
    var lol:String = "\u{00AF}\u{005C}\u{005F}\u{0028}\u{30C4}\u{0029}\u{005F}\u{002F}\u{00AF}"
    @IBOutlet weak var biNuOne: UITextField!
    @IBOutlet weak var biNuTwo: UITextField!
    @IBOutlet weak var arifmOutlet: UISegmentedControl!
    @IBOutlet weak var resultArifOper: UILabel!
    @IBOutlet weak var goToVC: UILabel!
    func dotta() {
        var i = 0
        for character in (biNuOne.text)! {
            if character == "." || character == "," {
                i += 1
            }
            if i == 2 {
                ((biNuOne.text)!).removeLast()
            }
        }
    }
    func dotta2() {
        var i = 0
        for character in (biNuTwo.text)! {
            if character == "." || character == "," {
                i += 1
            }
            if i == 2 {
                ((biNuTwo.text)!).removeLast()
            }
        }
    }

    @IBAction func onlyBin(_ sender: Any) {
        if ((biNuOne.text)!).count > 16 || ((biNuOne.text)!).contains("2") ||
            ((biNuOne.text)!).contains("3") ||
            ((biNuOne.text)!).contains("4") ||
            ((biNuOne.text)!).contains("5") ||
            ((biNuOne.text)!).contains("6") ||
            ((biNuOne.text)!).contains("7") ||
            ((biNuOne.text)!).contains("8") ||
            ((biNuOne.text)!).contains("9") {
            ((biNuOne.text)!).removeLast()
        }
        dotta()
        arifmOperFunction()
    }
    @IBAction func onlyBin2(_ sender: Any) {
        if ((biNuTwo.text)!).count > 16 || ((biNuTwo.text)!).contains("2") ||
            ((biNuTwo.text)!).contains("3") ||
            ((biNuTwo.text)!).contains("4") ||
            ((biNuTwo.text)!).contains("5") ||
            ((biNuTwo.text)!).contains("6") ||
            ((biNuTwo.text)!).contains("7") ||
            ((biNuTwo.text)!).contains("8") ||
            ((biNuTwo.text)!).contains("9") {
            ((biNuTwo.text)!).removeLast()
        }
        dotta2()
        arifmOperFunction()
    }
    func selectAction() {
        if arifmOutlet.selectedSegmentIndex == 0 {
            plus()
        }
        if arifmOutlet.selectedSegmentIndex == 1 {
            minus()
        }
        if arifmOutlet.selectedSegmentIndex == 2 {
            multiply()
        }
        if arifmOutlet.selectedSegmentIndex == 3 {
            if ((biNuTwo.text)!).doubleValue != 0 {
            divide()
            } else {
                resultArifOper.text = lol
            }
        }
    }
    func arifmOperFunction() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: font]
        goToVC.attributedText = NSAttributedString(string: NSLocalizedString("back to convert", comment: "back to convert")  , attributes: attributes)
        if ((biNuOne.text)!).count != 0 || ((biNuTwo.text)!).count != 0 {
        calcDecForBinOneTwo.binaryNumber = ((biNuOne.text)!).doubleValue
        calcDecForBinOneTwo.calculatingDecimal()
        biOneDecOne = calcDecForBinOneTwo.decimalNumberDouble
        } else {
            resultArifOper.text = lol
        }
        if ((biNuOne.text)!).count != 0 || ((biNuTwo.text)!).count != 0 {
            calcDecForBinOneTwo.binaryNumber = ((biNuTwo.text)!).doubleValue
            calcDecForBinOneTwo.calculatingDecimal()
            biTwoDecTwo = calcDecForBinOneTwo.decimalNumberDouble
        } else {
            resultArifOper.text = lol
        }
        selectAction()
    }
    func calculPrint() {
      converDecToBin.calculatingBinary()
      resultArifOper.text = converDecToBin.binaryNumberString + converDecToBin.binaryNumberResidueString
    }
    func plus() {
       if ((biNuOne.text)!).count != 0 && ((biNuTwo.text)!).count != 0 {
        if ((biNuOne.text)!).doubleValue == 0 && ((biNuTwo.text)!).doubleValue == 0 {
            resultArifOper.text = "0"
        } else {
            converDecToBin.decimalNumber = biOneDecOne + biTwoDecTwo
            calculPrint()
          }
       } else {
        resultArifOper.text = lol
        }
    }
    func minus() {
        if ((biNuOne.text)!).count != 0 && ((biNuTwo.text)!).count != 0 {
        if biTwoDecTwo < biOneDecOne {
            converDecToBin.decimalNumber = biOneDecOne - biTwoDecTwo
            stringMinus = ""
        } else {
            if biOneDecOne == biTwoDecTwo {
                stringMinus = "0"
            } else {
                converDecToBin.decimalNumber = biTwoDecTwo - biOneDecOne
                stringMinus = "-"
            }
        }
        converDecToBin.calculatingBinary()
        resultArifOper.text = stringMinus + converDecToBin.binaryNumberString + converDecToBin.binaryNumberResidueString
        } else {
            resultArifOper.text = lol
        }
    }
    func multiply() {
        if ((biNuOne.text)!).count != 0 && ((biNuTwo.text)!).count != 0 {
            if ((biNuOne.text)!).doubleValue == 0 || ((biNuTwo.text)!).doubleValue == 0 {
                resultArifOper.text = "0"
            } else {
        converDecToBin.decimalNumber = biOneDecOne * biTwoDecTwo
        calculPrint()
        }
        } else {
            resultArifOper.text = lol
        }
    }
    func divide() {
        if ((biNuOne.text)!).count != 0 && ((biNuTwo.text)!).count != 0 {
            if ((biNuOne.text)!).doubleValue == 0 {
                resultArifOper.text = "0"
            } else {
        converDecToBin.decimalNumber = biOneDecOne / biTwoDecTwo
        calculPrint()
            }
        } else {
            resultArifOper.text = lol
        }
    }
    @IBAction func arifmAction(_ sender: Any) {
        selectAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: font]
        biNuOne.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a binary number", comment: "enter a binary number"), attributes: attributes)
        biNuTwo.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a binary number", comment: "enter a binary number"), attributes: attributes)
        arifmOperFunction()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "VC3")
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
}

