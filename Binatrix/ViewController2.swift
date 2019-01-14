//
//  ViewController2.swift
//  BN
//
//  Created by REYNIKOV ANTON on 29.09.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit
//// Determination of height device
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
////
//// Change data for iPad
extension NSLayoutConstraint {
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
////
class ViewController2: UIViewController {
//// Check dot and comma
    func dotta() {
        var i = 0
        for character in (textF2.text)! {
            if character == "." || character == "," {
                i += 1
            }
            if i == 2 {
                image.flash()
                ((textF2.text)!).removeLast()
            }
        }
    }
////
//// Error
    func wrong() {
        button.isEnabled = true
        clearButtonImage.isHidden = true
        copyButtonImage.isHidden = true
        view.endEditing(true)
        image.flash()
        let font1 = UIFont(name: "Menlo-Bold",size: 20.0)!
        let attributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: font1]
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        textF2.attributedText = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes1)
        resultBi.attributedText = NSAttributedString(string: NSLocalizedString("convert Bin --> Dec", comment: "convert Bin --> Dec") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.textF2.text?.removeAll()
        }
    }
////
    @IBOutlet weak var vc2MultiBottom: NSLayoutConstraint!
    func resizeMulti() {
        if screenHeight == 480 {
            let newMultiplier:CGFloat = 1.6
            vc2MultiBottom = vc2MultiBottom.setMultiplier(multiplier: newMultiplier)
        }
    }
    @IBOutlet weak var labelHex: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var textF2: UITextField!
    @IBOutlet weak var resultBi: UILabel!
    func fontSizeResultBi() {
        if screenHeight == 480 {
            resultBi.font = resultBi.font.withSize(26)
        }
    }
    @IBOutlet weak var goToVC3: UILabel!
    @IBOutlet weak var clearButtonImage: UIButton!
    @IBOutlet weak var copyButtonImage: UIButton!
    @IBAction func clearButton(_ sender: Any) {
        textF2.text?.removeAll()
        calculatingBiFunction()
        view.endEditing(true)
    }
    @IBAction func copyButton(_ sender: Any) {
        image2.flash2()
        UIPasteboard.general.string = resultBi.text
        view.endEditing(true)
    }
    
    @IBAction func pasterButton2(_ sender: Any) {
        let pasteBoardString: String? = UIPasteboard.general.string
        if pasteBoardString == nil {
            wrong()
        } else {
            var i = 0
            for character in (pasteBoardString)! {
                if character == "." || character == "," {
                    i += 1
                }
            }
            if i > 1 {
                wrong()
            } else {
                
                if ((pasteBoardString)!).count <= 18{
                    for i in pasteBoardString! {
                        guard i == "0" ||
                            i == "1" ||
                            i == "2" ||
                            i == "3" ||
                            i == "4" ||
                            i == "5" ||
                            i == "6" ||
                            i == "7" ||
                            i == "8" ||
                            i == "9" ||
                            i == "." ||
                            i == "," else {
                                wrong()
                                return
                        }
                    }
                    textF2.text = pasteBoardString
                    calculatingBiFunction()
                } else {
                    wrong()
                }
            }
        }
    }
   
    @IBAction func textF2Dec(_ sender: Any) {
        if ((textF2.text)!).count > 18 {
            image.flash()
            ((textF2.text)!).removeLast()
        }
        dotta()
        calculatingBiFunction()
    }
    var calculatingBi = CalculatingBinary()
    func calculatingBiFunction() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        calculatingBi.decimalNumber = ((textF2.text)!).doubleValue
        calculatingBi.calculatingBinary()
        goToVC3.attributedText = NSAttributedString(string: NSLocalizedString("binary numbers calculator", comment: "binary numbers calculator") , attributes: attributes)
        if ((textF2.text)!).count != 0 {
            clearButtonImage.isHidden = false
            button.isEnabled = false
            copyButtonImage.isHidden = false
            resultBi.text = calculatingBi.binaryNumberString + calculatingBi.binaryNumberResidueString
        } else {
            button.isEnabled = true
            clearButtonImage.isHidden = true
            copyButtonImage.isHidden = true
            view.endEditing(true)
            resultBi.attributedText = NSAttributedString(string: NSLocalizedString("convert Bin --> Dec", comment: "convert Bin --> Dec") , attributes: attributes)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resizeMulti()
        fontSizeResultBi()
        RateManager.showRatesController()
        clearButtonImage.isHidden = true
        copyButtonImage.isHidden = true
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: font]
        textF2.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a decimal number", comment: "enter a decimal number") , attributes: attributes)
        calculatingBiFunction()
        runString(string: NSLocalizedString("converter DEC<->HEX<->OCT   Characters<->Unicode   ", comment: "converter DEC<->HEX<->OCT   Characters<->Unicode   "))
    }
//// Button to go to another program
    @IBAction func buttonHexastar(_ sender: Any) {
        let appURL = NSURL(string: "hexastarBinatrix://")!
        let webURL = NSURL(string: "https://itunes.apple.com/ru/app/hexastar/id1327719099")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            application.open(webURL as URL)
        }
    }
////
//// Running string
    func runStringArray(string:String) -> ([String]) {
        let myString = string
        var myStringAdd = myString
        var newString:String
        var substring:Substring
        var arrayRunString = [String]()
        myStringAdd.append(String(myString[myString.index(myString.startIndex, offsetBy: 0)..<myString.index(myString.startIndex, offsetBy: 15)]))
        var countString = 0
        for _ in myString {
            countString += 1
        }
        for i in 0...countString - 1 {
            substring = myStringAdd[myStringAdd.index(myStringAdd.startIndex, offsetBy: i)..<myStringAdd.index(myStringAdd.startIndex, offsetBy: i + 15)]
            newString = String(substring)
            arrayRunString.append(newString)
        }
        return arrayRunString
    }
    func runString(string:String) {
        let font = UIFont(name: "Menlo", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font]
        let count = runStringArray(string: string).count
        var q = 0
        _ = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { (timer) in
            self.labelHex.attributedText = NSAttributedString(string: self.runStringArray(string: string)[q], attributes: attributes)
            q += 1
            if q >= count {
                q = 0
            }
        }
    }
////
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "VC2")
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
}
