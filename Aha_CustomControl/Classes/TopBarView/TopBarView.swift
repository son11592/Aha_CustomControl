//
//  TopBarView.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/2/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import NibDesignable
import Localize_Swift

@IBDesignable
public class TopBarView: NibDesignable {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var bottomSeperator: UIView!
    
    
    override public func nibName() -> String {
        return "TopBarView"
    }
    
    @IBInspectable public var title: String = "Title" {
        didSet {
            self.titleLabel.text = title.localized()
        }
    }
    
    @IBInspectable public var hideLeftIcon: Bool = false {
        didSet {
            self.backButton.isHidden = hideLeftIcon
        }
    }
    
    @IBInspectable public var hideRightIcon: Bool = true {
        didSet {
            self.rightButton.isHidden = hideRightIcon
        }
    }
    
    @IBInspectable public var hideBottomSeparator: Bool = true {
        didSet {
            self.bottomSeperator.isHidden = hideBottomSeparator
        }
    }
    
    @IBInspectable open var contentColor: UIColor! = UIColor.white {
        didSet {
            titleLabel.textColor = contentColor
            backButton.tintColor = contentColor
            rightButton.setImageAllStates(image: rightButton.image(for: .normal)?.applyColor(color: contentColor))
        }
    }
    
    @IBInspectable open var separatorColor: UIColor! = UIColor(hexString: "#F5F5F5") {
        didSet {
            bottomSeperator.backgroundColor = separatorColor
        }
    }
    
    // MARK: Interface Builder
    override public func prepareForInterfaceBuilder() {
        if self.title.utf8.count == 0 {
            self.title = "Title"
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func fakeLeftButtonTouch(_ sender: Any) {
        if backButton.isHidden == false {
            backButton.sendActions(for: .touchUpInside)
        }
    }
    
    @IBAction func fakeRightButtonTouch(_ sender: Any) {
        if rightButton.isHidden == false {
            rightButton.sendActions(for: .touchUpInside)
        }
    }
}
