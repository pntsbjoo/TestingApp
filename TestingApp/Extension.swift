

import UIKit

extension UILabel {
    func bold(targetString: String) {
        let fontSize = self.font.pointSize
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
    func underLine(targetString: String) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString.init(string: fullText)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: range)
        self.attributedText = attributedString
    }
//    func underLineAndBold(boldTargetString: String, underLineTargetString: String) {
//        let fullText = self.text ?? ""
//        
//        let fontSize = self.font.pointSize
//        let font = UIFont.boldSystemFont(ofSize: fontSize)
//        
//        let boldRange = (fullText as NSString).range(of: boldTargetString)
//        let boldAttributedString = NSMutableAttributedString.init(string: fullText)
//        
//        let underLineRange = (fullText as NSString).range(of: underLineTargetString)
//        let underLineAttributedString = NSMutableAttributedString.init(string: fullText)
//        
//        let attributedString = NSMutableAttributedString(string: fullText)
//        attributedString.addAttributes(attr, range: range)
//    }
}

//Button
extension UIButton {
    func setBorderWidthColourRadius(_ button: UIButton, _ width:CGFloat, color:UIColor, _ radius: CGFloat) {
        button.layer.borderColor = color.cgColor
        button.layer.borderWidth = width
        button.layer.cornerRadius = radius
    }
}

//TextField
extension UITextField {
    func drawUnderLineforTextField(_ textfield:UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x:0.0, y:textfield.frame.height - 1, width:textfield.frame.width, height:1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        textfield.borderStyle = UITextField.BorderStyle.none
        textfield.layer.addSublayer(bottomLine)
    }
}

//Regular Expression
extension String {
    
}

//Alert
extension UIAlertController {
    
    func showAlertDone(viewController: UIViewController, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: handler))
        viewController.present(alert, animated: true, completion: nil)
    }

    func showAlertSelect(viewController: UIViewController, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: handler))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: handler))
        viewController.present(alert, animated: true, completion: nil)
    }
}

