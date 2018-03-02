//
//  NotificationNews.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/27/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class NotificationNews: Object, Mappable {
    dynamic var type = ""
    dynamic var title = ""
    dynamic var message = ""
    dynamic var url: String? = nil
    dynamic var promo_code: String? = nil
    dynamic var image_url: String? = nil
    dynamic var updateTime = Date()
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    func mapping(map: Map) {
        type <- map["type"]
        title <- map["title"]
        message <- map["message"]
        url <- map["url"]
        promo_code <- map["promo_code"]
        image_url <- map["image_url"]
        updateTime <- (map["time"], DateTransform())
    }
}
