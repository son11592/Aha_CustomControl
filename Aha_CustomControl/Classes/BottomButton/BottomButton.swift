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

@IBDesignable
class BottomButton: NibDesignable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var imageButton: DOFavoriteButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var dotIcon: UIImageView!
    
    var touch:(()->())?
    
    
    @IBInspectable var title: String? = "Title" {
        didSet {
            self.titleLabel.text = title?.localized()
        }
    }
    
    @IBInspectable open var image: UIImage! {
        didSet {
            self.imageButton.image = image
        }
    }
    
    @IBInspectable var isActive: Bool = true {
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
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    //MARK: - IBAction
    
    @IBAction func onTouch(_ sender: Any) {
        if let _touch = self.touch {
            _touch()
        }
    }
    
}
