//
//  ScalingTextField.swift
//  ahamove
//
//  Created by DuongNgoAnh on 9/22/17.
//  Copyright © 2017 ahamove. All rights reserved.
//

import UIKit
import MaterialTextField

open class ScalingTextField: UITextField {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            if let clearButton = subview as? UIButton {
                for state : UIControlState in [.normal, .highlighted, .disabled, .selected] {
                    clearButton.setBackgroundImage(UIImage(named: "clear_icon"), for:state)
                    clearButton.setImage(nil, for: state)
                }
            }
        }
    }

    override open func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        let originSize = originalRect.size
        let scaling = GlobalVariable.instance.scaleHeight*0.9
        let newSize = CGSize(width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
        return CGRect(x: originalRect.origin.x - newSize.width + originSize.width, y: originalRect.origin.y - (newSize.height - originSize.height)/2.0, width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
    }

}

open class ScalingPhoneNumberTextField: PhoneNumberTextField {
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            if let clearButton = subview as? UIButton {
                for state : UIControlState in [.normal, .highlighted, .disabled, .selected] {
                    clearButton.setBackgroundImage(UIImage(named: "clear_icon"), for:state)
                    clearButton.setImage(nil, for: state)
                }
            }
        }
    }
    
    override open func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        let originSize = originalRect.size
        let scaling = GlobalVariable.instance.scaleHeight*0.9
        let newSize = CGSize(width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
        return CGRect(x: originalRect.origin.x - newSize.width + originSize.width, y: originalRect.origin.y - (newSize.height - originSize.height)/2.0, width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
    }
}

open class ScalingMFTextField: MFTextField {
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            if let clearButton = subview as? UIButton {
                for state : UIControlState in [.normal, .highlighted, .disabled, .selected] {
                    clearButton.setBackgroundImage(UIImage(named: "clear_icon"), for:state)
                    clearButton.setImage(nil, for: state)
                }
            }
        }
    }
    
    override open func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        let originSize = originalRect.size
        let scaling = GlobalVariable.instance.scaleHeight*0.9
        let newSize = CGSize(width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
        return CGRect(x: originalRect.origin.x - newSize.width + originSize.width, y: originalRect.origin.y - (newSize.height - originSize.height)/2.0, width: originalRect.size.width*scaling, height: originalRect.size.height*scaling)
    }
}
