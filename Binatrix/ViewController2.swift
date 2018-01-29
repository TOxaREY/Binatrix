//
//  ViewController2.swift
//  BN
//
//  Created by REYNIKOV ANTON on 29.09.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
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
        textF2.attributedText = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes1)
        resultBi.attributedText = NSAttributedString(string: NSLocalizedString("convert Bin --> Dec", comment: "convert Bin --> Dec") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.textF2.text?.removeAll()
        }
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var textF2: UITextField!
    @IBOutlet weak var resultBi: UILabel!
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
                        print(i)
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
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: font]
        calculatingBi.decimalNumber = ((textF2.text)!).doubleValue
        calculatingBi.calculatingBinary()
        goToVC3.attributedText = NSAttributedString(string: NSLocalizedString("binary numbers calculator", comment: "binary numbers calculator") , attributes: attributes)
        print(textF2.text)
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
        RateManager.showRatesController()
        clearButtonImage.isHidden = true
        copyButtonImage.isHidden = true
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: font]
        textF2.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a decimal number", comment: "enter a decimal number") , attributes: attributes)
        calculatingBiFunction()
    }
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
