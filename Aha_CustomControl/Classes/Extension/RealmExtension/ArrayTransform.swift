// Based on Swift 1.2, ObjectMapper 0.15, RealmSwift 0.94.1
// Author: Timo Wälisch <timo@waelisch.de>

import UIKit
import RealmSwift
import ObjectMapper
//import SwiftyJSON

class ArrayTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    typealias Object = List<T>
    typealias JSON = Array<AnyObject>
    
    let mapper = Mapper<T>()
      
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let result = List<T>()
        if let tempArr = value as! Array<Any>? {
            for entry in tempArr {
                if entry is NSNull {
                    continue
                }
                
                let mapper = Mapper<T>()
                let model : T
                if entry is String || entry is Double {
                    model = mapper.map(JSONObject: ["value":entry])!
                }
                else {
                    model = mapper.map(JSONObject: entry)!
                }
                
                result.append(model)
            }
        }
        return result
    }
    
    // transformToJson was replaced with a solution by @zendobk from https://gist.github.com/zendobk/80b16eb74524a1674871
    // to avoid confusing future visitors of this gist. Thanks to @marksbren for pointing this out (see comments of this gist)
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [AnyObject]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json as AnyObject)
            }
        }
        return results
    }
}
