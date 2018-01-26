//
//  GlobalVariable.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/9/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit

class GlobalVariable: NSObject {

    static let instance = GlobalVariable()

    override init() {
        super.init()
    }

    var scaleHeight: CGFloat {
        return UIScreen.main.bounds.size.height / 667.0
    }

    var scaleWidth: CGFloat {
        return UIScreen.main.bounds.size.width / 375.0
    }

    var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }

    var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    var countryCode = "84"
    var regionCode = "VN"   //PhoneNumberKit.defaultRegionCode may be
}

