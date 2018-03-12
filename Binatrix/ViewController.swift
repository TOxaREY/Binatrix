//
//  ViewController.swift
//  BN
//
//  Created by REYNIKOV ANTON on 29.09.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//
import UIKit
extension UIImageView {
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    func flash2() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 2
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 0
        layer.add(flash, forKey: nil)
    }
}
extension String {
    var doubleValue: Double {
        let nf = NumberFormatter()
        nf.decimalSeparator = "."
        if let result = nf.number(from: self) {
            return result.doubleValue
        } else {
            nf.decimalSeparator = ","
            if let result = nf.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
  }
class NMTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
class ViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    func dotta() {
        var i = 0
        for character in (textF.text)! {
            if character == "." || character == "," {
                i += 1
            }
            if i == 2 {
                image.flash()
                ((textF.text)!).removeLast()
            }
        }
     }
    func wrong() {
        button.isEnabled = true
        clearButtonImage.isHidden = true
        copyButtonImage.isHidden = true
        view.endEditing(true)
        image.flash()
        let font1 = UIFont(name: "Menlo-Bold",size: 20.0)!
        let attributes1 = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: font1]
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: font]
        textF.attributedText = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes1)
        resultDec.attributedText = NSAttributedString(string: NSLocalizedString("convert Dec --> Bin", comment: "convert Dec --> Bin") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.textF.text?.removeAll()
        }
    }
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var resultDec: UILabel!
    @IBOutlet weak var goToVC3: UILabel!
    @IBOutlet weak var clearButtonImage: UIButton!
    @IBOutlet weak var copyButtonImage: UIButton!
    @IBAction func clearButton(_ sender: Any) {
        textF.text?.removeAll()
        calculatingDecFunction()
        view.endEditing(true)
    }
    @IBAction func copyButton(_ sender: Any) {
        image2.flash2()
        UIPasteboard.general.string = resultDec.text
        view.endEditing(true)
    }
    @IBAction func pasterButton(_ sender: Any) {
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
                
                if ((pasteBoardString)!).count <= 16{
                    for i in pasteBoardString! {
                        guard i == "0" ||
                            i == "1" ||
                            i == "." ||
                            i == "," else {
                                wrong()
                                return
                        }
                    }
                    textF.text = pasteBoardString
                    calculatingDecFunction()
                } else {
                    wrong()
                }
            }
        }
    }
    @IBAction func textFBi(_ sender: Any) {
        if ((textF.text)!).count > 16 || ((textF.text)!).contains("2") ||
            ((textF.text)!).contains("3") ||
            ((textF.text)!).contains("4") ||
            ((textF.text)!).contains("5") ||
            ((textF.text)!).contains("6") ||
            ((textF.text)!).contains("7") ||
            ((textF.text)!).contains("8") ||
            ((textF.text)!).contains("9") {
             image.flash()
            ((textF.text)!).removeLast()
          }
        dotta()
        calculatingDecFunction()
    }
    var calculatingDec = CalculatingDecimal()
    func calculatingDecFunction() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: font]
        calculatingDec.binaryNumber = ((textF.text)!).doubleValue
        calculatingDec.calculatingDecimal()
        goToVC3.attributedText = NSAttributedString(string: NSLocalizedString("binary numbers calculator", comment: "binary numbers calculator") , attributes: attributes)
        if ((textF.text)!).count != 0 {
            clearButtonImage.isHidden = false
            button.isEnabled = false
            copyButtonImage.isHidden = false
            resultDec.text = calculatingDec.decimalNumberString + calculatingDec.decimalNumberResidueString
        } else {
            button.isEnabled = true
            clearButtonImage.isHidden = true
            copyButtonImage.isHidden = true
            view.endEditing(true)
            resultDec.attributedText = NSAttributedString(string: NSLocalizedString("convert Dec --> Bin", comment: "convert Dec --> Bin") , attributes: attributes)
          }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButtonImage.isHidden = true
        copyButtonImage.isHidden = true
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: font]
        textF.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a binary number", comment: "enter a binary number"), attributes: attributes)
        calculatingDecFunction()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "VC")
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
}
