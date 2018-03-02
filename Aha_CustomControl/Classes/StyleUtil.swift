//
//  TextStyleUtil.swift
//  AhaFood
//
//  Created by DuongNgoAnh on 12/27/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import DynamicColor

enum HexColorString: String {

    //New Style Color
    case white = "#FFFFFF"
    case darkText = "#131313"
    case gray = "#9B9B9B"
    case darkgray = "#313136"
    case lightgray = "#EFEFEF"
    case separator = "#F5F5F5"
    case greenButton = "#34CE64"
    case greenText   = "#1DB954"
    case hightlight = "#FF5722"
    case mapRoute = "#1BE58D"

    func getColor() -> UIColor {
        return UIColor(hexString: self.rawValue)
    }
}

enum ColorStyle: Int {
    case greenButton = 1

    func getColor() -> UIColor {
        var color = UIColor.black

        switch self {
        case .greenButton:
            color = HexColorString.greenButton.getColor()
        }
        return color
    }
}

enum TextStyling: Int {
    case lalaStyleH1 = 1
    case lalaSytleH2 = 2
    case lalaStyleH3 = 3
    case lalaStyleH4 = 4
    case lalaTextStyle1 = 5
    case lalaTextStyle1a = 6
    case lalaTextStyle2 = 7
    case lalaTextStyle3 = 8
    case lalaTextStyle4 = 9
    case lalaTextStyle5 = 10
    case lalaTextStyle6 = 11
    case lalaTextStyle7 = 12
    case lalaTextStyle8 = 13
    case lalaTextStyle8a = 14
    case lalaTextStyle9 = 15
    case lalaTextStyle10 = 16
    case lalaTextStyle11 = 17
    case lalaTextStyle12 = 18
    case lalaTextStyle13 = 19
    case lalaTextStyle14 = 20
    case lalaTextStyle15 = 21

    func getFont() -> UIFont {
        var font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0))
        switch self {
        case .lalaStyleH1:
            font = UIFont.systemFont(ofSize: 32*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        case .lalaSytleH2:
            font = UIFont.systemFont(ofSize: 32*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        case .lalaStyleH3:
            font = UIFont.systemFont(ofSize: 18*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        case .lalaStyleH4:
            font = UIFont.systemFont(ofSize: 16*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle1:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle1a:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle2:   //9B9B9B
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle3:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle4:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightLight)
        case .lalaTextStyle5:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        case .lalaTextStyle6:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle7:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle8:
            font = UIFont.systemFont(ofSize: 12*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle8a:
            font = UIFont.systemFont(ofSize: 12*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle9:
            font = UIFont.systemFont(ofSize: 12*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle10:
            font = UIFont.systemFont(ofSize: 12*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle11:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        case .lalaTextStyle12:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle13:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightSemibold)
        case .lalaTextStyle14:
            font = UIFont.systemFont(ofSize: 16*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightRegular)
        case .lalaTextStyle15:
            font = UIFont.systemFont(ofSize: 14*(UIScreen.main.bounds.size.height / 667.0), weight: UIFontWeightHeavy)
        }
        return font
    }

    func getColor() -> UIColor {
        var color = UIColor.black
        switch self {
        case .lalaStyleH1:
            color = HexColorString.white.getColor()
        case .lalaSytleH2:
            color = HexColorString.darkText.getColor()
        case .lalaStyleH3:
            color = HexColorString.darkText.getColor()
        case .lalaStyleH4:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle1:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle1a:
            color = HexColorString.white.getColor()
        case .lalaTextStyle2:
            color = HexColorString.gray.getColor()
        case .lalaTextStyle3:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle4:
            color = HexColorString.gray.getColor()
        case .lalaTextStyle5:
            color = HexColorString.hightlight.getColor()
        case .lalaTextStyle6:
            color = HexColorString.greenText.getColor()
        case .lalaTextStyle7:
            color = HexColorString.hightlight.getColor()
        case .lalaTextStyle8:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle8a:
            color = HexColorString.white.getColor()
        case .lalaTextStyle9:
            color = HexColorString.gray.getColor()
        case .lalaTextStyle10:
            color = HexColorString.gray.getColor()
        case .lalaTextStyle11:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle12:
            color = HexColorString.white.getColor()
        case .lalaTextStyle13:
            color = HexColorString.gray.getColor()
        case .lalaTextStyle14:
            color = HexColorString.darkText.getColor()
        case .lalaTextStyle15:
            color = HexColorString.darkText.getColor()
        }
        return color
    }
}

extension UIView {
    private struct CustomProperties {
        static var backgroundStyle: Int = 0
    }

    @IBInspectable var bgStyle: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.backgroundStyle) as! Int
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.backgroundStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if let style = ColorStyle(rawValue: newValue) {
                setBackgroundStyling(style: style)
            }
        }
    }

    func setBackgroundStyling(style: ColorStyle) {
        self.backgroundColor = style.getColor()
    }
}

extension UILabel {
    private struct CustomProperties {
        static var textStyle: Int = 0
    }

    @IBInspectable var textStyle: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.textStyle) as! Int
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.textStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if let style = TextStyling(rawValue: newValue) {
                setTextStyling(style: style)
            }
        }
    }

    func setTextStyling(style: TextStyling) {
        self.textColor = style.getColor()
        self.font = style.getFont()
    }
}

extension UITextField {
    private struct CustomProperties {
        static var textStyle: Int = 0
    }

    @IBInspectable var textStyle: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.textStyle) as! Int
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.textStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if let style = TextStyling(rawValue: newValue) {
                setTextStyling(style: style)
            }
        }
    }

    func setTextStyling(style: TextStyling) {
        self.textColor = style.getColor()
        self.font = style.getFont()
    }
}

extension UITextView {
    private struct CustomProperties {
        static var textStyle: Int = 0
    }

    @IBInspectable var textStyle: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.textStyle) as! Int
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.textStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if let style = TextStyling(rawValue: newValue) {
                setTextStyling(style: style)
            }
        }
    }

    func setTextStyling(style: TextStyling) {
        self.textColor = style.getColor()
        self.font = style.getFont()
    }
}

extension UIButton {
    private struct CustomProperties {
        static var textStyle: Int = 0
    }

    @IBInspectable var textStyle: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.textStyle) as! Int
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.textStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if let style = TextStyling(rawValue: newValue) {
                setTextStyling(style: style)
            }
        }
    }

    func setTextStyling(style: TextStyling) {
        self.titleLabel?.font = style.getFont()
        let allStates: [UIControlState] = [.normal, .highlighted, .disabled, .selected]

        for state in allStates {
            self.setTitleColor(style.getColor(), for: state)
        }
    }
}
