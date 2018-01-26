//
//  Utils.swift
//  Driver
//
//  Created by DuongNgoAnh on 2/23/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func getHttpsUrl(url: String) -> String {
        if url.range(of: "https") != nil {
            return url
        }
        else if url.range(of: "http") != nil {

            return url.replacingOccurrences(of: "http", with: "https")
        }
        else {
            return "https://\(url)"
        }
    }
}
