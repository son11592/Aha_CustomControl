//
//  NetworkErrorUtil.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/14/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit

class NetworkErrorUtil: NSObject {
    static var instance = NetworkErrorUtil()
    static let Network_Offline = 1009
    static let Encoding_Error = 1010
    
    func handleNetworkError(errorCode: Int, failMessage: String?) {
        switch errorCode {
        case NetworkErrorUtil.Network_Offline:
            AlertUtil.instance.showAlert(title: nil, message: "No internet connection".localized())
        default:
            break
        }
    }
    
}
