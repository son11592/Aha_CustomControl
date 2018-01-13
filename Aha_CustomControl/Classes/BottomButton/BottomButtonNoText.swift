//
//  BottomButtonNoText.swift
//  AhaFood
//
//  Created by DuongNgoAnh on 10/12/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import DynamicColor
import NibDesignable

@IBDesignable
class BottomButtonNoText: NibDesignable {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var imageButton: DOFavoriteButton!
    @IBOutlet var dotIcon: UIImageView!

    @IBOutlet var _dotWidth: NSLayoutConstraint!
    @IBOutlet weak var _dotTrailing: NSLayoutConstraint!
    @IBOutlet weak var _dotTop: NSLayoutConstraint!
    
    @IBInspectable public var dotTrailing: CGFloat {
        set {
            _dotTrailing.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotTrailing.constant
        }
    }

    @IBInspectable public var doTop: CGFloat {
        set {
            _dotTop.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotTop.constant
        }
    }

    @IBInspectable public var dotWidth: CGFloat {
        set {
            _dotWidth.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotWidth.constant
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageButton.imageColorOn = UIColor(hexString: "#F05522")
        imageButton.circleColor = UIColor(hexString: "#F05522")
        imageButton.lineColor = UIColor(hexString: "#F05522")
        imageButton.imageColorOff = UIColor(hexString: "#C2C4CA")
    }
    
    var touchBlock:(()->())?
    
    @IBInspectable open var image: UIImage! {
        didSet {
            if imageButton != nil {
                imageButton.image = image
            }
        }
    }
    
    @IBInspectable var isActive: Bool = true {
        didSet {
            updateImage()
        }
    }
    
    private func updateImage() {
        if imageButton == nil {
            return
        }
        if isActive {
            self.imageButton.select()
        }
        else {
            self.imageButton.deselect()
        }
    }
    
    // MARK: Interface Builder
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.imageButton.image = UIImage(named: "notifications_icon")
    }
    
    //MARK: - IBAction
    
    @IBAction func onTouch(_ sender: Any) {
        touchBlock?()
    }

}
