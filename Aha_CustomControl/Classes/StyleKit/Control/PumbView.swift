//
//  PumbView.swift
//  AhaFood
//
//  Created by DuongNgoAnh on 11/3/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import DynamicColor

class PumbView: UIView {
    @IBInspectable var outerColor: UIColor! = UIColor(hexString: "#F5A623").withAlphaComponent(0.3)
    @IBInspectable var innerColor: UIColor! = UIColor(hexString: "#F05522")
    @IBInspectable var maxOuterSize: CGFloat = 260
    @IBInspectable var maxInnerSize: CGFloat = 34
    @IBInspectable var minInnerSize: CGFloat = 18
    
    var progress :CGFloat = 0
    var timer: Timer?
    var animateTime :Double = 2
    let duration :TimeInterval = 1/30
    
    override var isHidden: Bool {
        willSet {
            if newValue != isHidden {
                if !newValue {
                    progress = 0
                    startTimer()
                }
                else {
                    timer?.invalidate()
                    timer = nil
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCustom()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCustom()
    }
    
    func initCustom() {
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    func updateProgress() {
        progress += CGFloat(duration/animateTime)
        if progress >= 1 {
            progress = 0
        }
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        AhamoveStyleKit.drawPumb(withOuterColor: outerColor, innerColor: innerColor, viewHeight: self.frame.size.height, viewWidth: self.frame.size.width, maxOuterSize: maxOuterSize, maxInnerSize: maxInnerSize, minInnerSize: minInnerSize, progress: progress)
    }

}
