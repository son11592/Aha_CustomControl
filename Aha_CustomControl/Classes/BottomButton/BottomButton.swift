//
//  BottomButton.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/17/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import DynamicColor
import NibDesignable
import Localize_Swift

@IBDesignable
open class BottomButton: NibDesignable {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet open weak var imageButton: DOFavoriteButton!
    @IBOutlet open weak var titleLabel: UILabel!
    @IBOutlet open var dotIcon: UIImageView!
    
    open var touch:(()->())?
    
    
    @IBInspectable open var title: String? = "Title" {
        didSet {
            self.titleLabel.text = title?.localized()
        }
    }
    
    @IBInspectable open var image: UIImage! {
        didSet {
            self.imageButton.image = image
        }
    }
    
    @IBInspectable open var isActive: Bool = true {
        didSet {
            updateImage()
            updateLabel()
        }
    }
    
    private func updateImage() {
        if isActive {
            self.imageButton.select()
        }
        else {
            self.imageButton.deselect()
        }
    }
    
    private func updateLabel() {
        if isActive {
            self.titleLabel.textColor = .white
        }
        else {
            self.titleLabel.textColor = UIColor(hexString: "#80848A")
        }
    }
    
    // MARK: Interface Builder
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    //MARK: - IBAction
    
    @IBAction open func onTouch(_ sender: Any) {
        if let _touch = self.touch {
            _touch()
        }
    }
    
}
