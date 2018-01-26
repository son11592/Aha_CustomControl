//
//  ExtensionUtils.swift
//  ahamove
//
//  Created by DuongNgoAnh on 9/29/17.
//  Copyright © 2017 ahamove. All rights reserved.
//

import UIKit
import AlamofireImage
import MapKit
import SideMenuController
import DynamicColor

public extension Array where Element: Comparable {
    public func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}

public extension Array {
    public var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
}

public extension UITableView {
    public func hideEmptyCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
}

public extension UIButton {
    public func setImageAllStates(image: UIImage?) {
        let allStates :[UIControlState] = [.normal, .highlighted, .disabled, .selected]
        
        for state in allStates {
            self.setImage(image, for: state)
        }
    }
}

public extension UIImage {
    public func cropImage(to cropRect: CGRect) -> UIImage? {
        let rect = CGRect(x: cropRect.origin.x * self.scale, y: cropRect.origin.y * self.scale, width: cropRect.size.width * self.scale, height: cropRect.size.height * self.scale)
        if let imageRef = self.cgImage?.cropping(to: rect) {
            let result = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
            return result
        }
        else {
            return nil
        }
    }
    
    public func applyColor(color: UIColor) -> UIImage? {
        // begin a new image context, to draw our colored image onto with the right scale
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        // get a reference to that context we created
        if let context = UIGraphicsGetCurrentContext() {
            // set the fill color
            color.setFill()
            // translate/flip the graphics context (for transforming from CG* coords to UI* coords
            context.translateBy(x: 0, y: self.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            
            context.setBlendMode(.colorBurn)
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
            context.draw(self.cgImage!, in: rect)
            
            context.setBlendMode(.sourceIn)
            context.addRect(rect)
            context.drawPath(using: .fill)
            
            // generate a new UIImage from the graphics context we drew onto
            let coloredImg = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return coloredImg
        }
        else {
            return nil
        }
    }
}

public extension UIView {
    public func takeScreenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    public func applyShadow(scaleSize: CGFloat = 1) {
        self.layer.shadowOffset =  CGSize(width: 1, height: 1) //CGSize.zero
        self.layer.shadowColor = UIColor(red:0.72, green:0.72, blue:0.72, alpha:0.36).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2*scaleSize //10*scaleSize
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func applyCorner(scaleSize: CGFloat = 1) {
        self.layer.cornerRadius = 3*scaleSize
    }
    
    public func applyShadowAndCorner(scaleSize: CGFloat = 1) {
        applyShadow(scaleSize: scaleSize)
        applyCorner(scaleSize: scaleSize)
    }
    
    public func applyBorder() {
        self.layer.borderColor = UIColor(hexString: "#CCCCCC").cgColor
        self.layer.borderWidth = 1;
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
}

public extension MKPolyline {
    public var coordinates: [CLLocationCoordinate2D] {
        var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                              count: self.pointCount)
        
        self.getCoordinates(&coords, range: NSRange(location: 0, length: self.pointCount))
        
        return coords
    }
}

public extension Double {
    public func cleanString(maxDigit: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = maxDigit
        formatter.numberStyle = .decimal
        
        if let result = formatter.string(from: NSNumber(value: self)) {
            return result
        }
        else {
            return String(format: "%g", self)
        }
    }
}

public extension String {
    
    public var length: Int {
        return self.count
    }
    
    public subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    public func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    public func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    public subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    public func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    public func nsRange(of subString: String) -> NSRange? {
        if let _range = self.range(of: subString) {
            return self.nsRange(from: _range)
        }
        else {
            return nil
        }
    }
    
    public func capitalizedFirst() -> String {
        let first = self[self.startIndex ..< self.index(startIndex, offsetBy: 1)]
        let rest = self[self.index(startIndex, offsetBy: 1) ..< self.endIndex]
        return first.uppercased() + rest.lowercased()
    }
    
    public func capitalizedFirst(with: Locale?) -> String {
        let first = self[self.startIndex ..< self.index(startIndex, offsetBy: 1)]
        let rest = self[self.index(startIndex, offsetBy: 1) ..< self.endIndex]
        return first.uppercased(with: with) + rest.lowercased(with: with)
    }
    
    public func jsonToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

public extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topController = self.topViewController {
            return topController.preferredStatusBarStyle
        }
        return .lightContent
    }
}

public extension SideMenuController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topController = self.centerViewController {
            return topController.preferredStatusBarStyle
        }
        return .lightContent
    }
}

public extension UIViewController {
    public func isDisplay() -> Bool {
        if self.isViewLoaded && view.window != nil {
            return true
        }
        else {
            return false
        }
    }
}

public extension Dictionary {
    
    public var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
}

public protocol EnumCollection: Hashable {
    static func cases() -> AnySequence<Self>
    static var allValues: [Self] { get }
}

public extension EnumCollection {
    
    public static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    public static var allValues: [Self] {
        return Array(self.cases())
    }
}

public extension DispatchQueue {
    static var userInteractive: DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var userInitiated: DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var utility: DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var background: DispatchQueue { return DispatchQueue.global(qos: .background) }

    public func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
