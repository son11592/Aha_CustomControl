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
open class BottomButtonNoText: NibDesignable {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet open weak var imageButton: DOFavoriteButton!
    @IBOutlet open var dotIcon: UIImageView!

    @IBOutlet open var _dotWidth: NSLayoutConstraint!
    @IBOutlet open weak var _dotTrailing: NSLayoutConstraint!
    @IBOutlet open weak var _dotTop: NSLayoutConstraint!
    
    @IBInspectable open var dotTrailing: CGFloat {
        set {
            _dotTrailing.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotTrailing.constant
        }
    }

    @IBInspectable open var doTop: CGFloat {
        set {
            _dotTop.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotTop.constant
        }
    }

    @IBInspectable open var dotWidth: CGFloat {
        set {
            _dotWidth.constant = newValue
            layoutIfNeeded()
        }
        get {
            return _dotWidth.constant
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        imageButton.imageColorOn = UIColor(hexString: "#F05522")
        imageButton.circleColor = UIColor(hexString: "#F05522")
        imageButton.lineColor = UIColor(hexString: "#F05522")
        imageButton.imageColorOff = UIColor(hexString: "#C2C4CA")
    }
    
    open var touchBlock:(()->())?
    
    @IBInspectable open var image: UIImage! {
        didSet {
            if imageButton != nil {
                imageButton.image = image
            }
        }
    }
    
    @IBInspectable open var isActive: Bool = true {
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
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.imageButton.image = UIImage(named: "notifications_icon")
    }
    
    //MARK: - IBAction
    
    @IBAction open func onTouch(_ sender: Any) {
        touchBlock?()
    }

}
