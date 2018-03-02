//
//  Utils.swift
//  Driver
//
//  Created by DuongNgoAnh on 2/23/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import RealmSwift
import KeychainAccess
import AlamofireNetworkActivityIndicator
import MapKit
import SwiftDate
import GoogleMaps



class Utils: NSObject {
    
    static func baseUrl()->String {
        if  let infoPlist = Bundle.main.infoDictionary,
            let httpProtocol = infoPlist["PROTOCOL"] as? String,
            let serverAddr = infoPlist["SERVER_ADDRESS"] as? String{
            return String(format: "%@://%@", httpProtocol, serverAddr)
        }
        else {
            return ""
        }
    }
    
    static func adminUrl()->String {
        if  let infoPlist = Bundle.main.infoDictionary,
            let httpProtocol = infoPlist["PROTOCOL"] as? String,
            let adminAddr = infoPlist["ADMIN_ADDRESS"] as? String{
            return String(format: "%@://%@", httpProtocol, adminAddr)
        }
        else {
            return ""
        }
    }
    
    static func versionName()->String {
        if let infoPlist = Bundle.main.infoDictionary,
            let versionName = infoPlist["APP_VERSION_NAME"] as? String,
            let versionNumber = infoPlist["APP_VERSION_NUMBER"] as? String,
            let versionBuild = infoPlist["CFBundleVersion"] as? String {
            return "Version \(versionName) \(versionNumber).\(versionBuild)"
        }
        else {
            return ""
        }
    }
    
    static func numCheckVersion()->Int? {//
        if let infoPlist = Bundle.main.infoDictionary,
            let checkVersionNumber = infoPlist["IOS_APP_VERSION"] as? String{
            return Int(checkVersionNumber)
        }
        else {
            return nil
        }
    }
    
    //Set default realm with encryption
    static func initRealm(key: String = "encryptRealm") {
        let key = Utils.getEncryptKeyChain(key: key)
        var configuration = Realm.Configuration(encryptionKey: key)
        configuration.deleteRealmIfMigrationNeeded = true
        configuration.schemaVersion = UInt64(Bundle.main.object(forInfoDictionaryKey: "REALM_VERSION") as! String)!
        
        do {
            let _ = try Realm(configuration: configuration)
        } catch _ as NSError {
            // If the encryption key is wrong, `error` will say that it's an invalid database
            try! FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        }
        
        Realm.Configuration.defaultConfiguration = configuration
    }
    
    //Get encrypt data from keychain. If not exists, creating it
    static func getEncryptKeyChain(key: String) -> Data {
        let keychain = Keychain(service: baseUrl())
        if let encryptKeyData = try? keychain.getData(key) {
            if encryptKeyData != nil {
                return encryptKeyData!
            }
            else {
                let keyData = NSMutableData(length: 64)!
                let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
                assert(result == 0, "Failed to get random bytes")
                keychain[data: key] = keyData as Data
                return keyData as Data
            }
        }
        else {
            let keyData = NSMutableData(length: 64)!
            let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
            assert(result == 0, "Failed to get random bytes")
            keychain[data: key] = keyData as Data
            return keyData as Data
        }
    }
    
    static func getUDID()->String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func openAppSettings() {
        if let settingsURL = URL(string: UIApplicationOpenSettingsURLString + Bundle.main.bundleIdentifier!) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(settingsURL)
            }
        }
    }
    
    //MARK: - Validate
    static func isValidMobile(mobile: String,
                              regionCode: String = PhoneNumberKit.defaultRegionCode()) -> Bool {
        // this obviously won't be
        let phoneNumberKit = PhoneNumberKit()
        do {
            _ = try phoneNumberKit.parse(mobile, withRegion: regionCode, ignoreType: false)
            return true
        }
        catch {
            return false
        }
    }

    static func getNationalPhoneNumber(mobile: String,
                                       regionCode: String = PhoneNumberKit.defaultRegionCode()) -> String {
        // this obviously won't be
        let phoneNumberKit = PhoneNumberKit()
        do {
            let phoneNumber = try phoneNumberKit.parse(mobile, withRegion: regionCode, ignoreType: false)
            return PhoneNumberKit().format(phoneNumber, toType: .national)
        }
        catch {
            return mobile
        }
    }

    static func fixMobileNumber(mobile: String,
                                regionCode: String = PhoneNumberKit.defaultRegionCode())->String {
        var newNumber = mobile
        if let countryCode = PhoneNumberKit().countryCode(for: regionCode) { //84 for VN
            let countryCodeString :String = "\(countryCode)"
            let subString = mobile.substring(to: countryCodeString.length)
            if subString == countryCodeString {
                newNumber = "+\(mobile)"
            }
        }
        return PartialFormatter().formatPartial(newNumber)
    }
    
    static func isValidEmail(testStr:String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx, options: .caseInsensitive)
            let results = regex.matches(in: testStr, range: NSRange(location: 0, length: testStr.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch _ as NSError {
            returnValue = false
        }
        
        return  returnValue
    }
    
    static func enableNetworkIndicatorManagement() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }
    
    static func isSameLocation(firstLocation: CLLocationCoordinate2D, secondLocation: CLLocationCoordinate2D, epsilon eps: Double = 0.00001) -> Bool {
        if fabs(firstLocation.latitude - secondLocation.latitude) <= eps && fabs(firstLocation.longitude - secondLocation.longitude) <= eps {
            return true
        }
        return false
    }
    
    //MARK:- Image
    
    //fileSize in megabytes
    static func reduceImageData(image: UIImage, limitSize: Double) -> Data{
        var compression = 1.0
        let maxCompression = 0.1
        let maxFileSize = limitSize*1024*1024    //megabytes -> kbytes -> byte
        
        var imageData = UIImageJPEGRepresentation(image, CGFloat(compression))!
        while Double(imageData.count) > maxFileSize && compression > maxCompression {
            compression -= 0.1
            imageData = UIImageJPEGRepresentation(image, CGFloat(compression))!
        }
        
        return imageData
    }
    
    static func image(by image: UIImage, with color: UIColor) -> UIImage {
        // begin a new image context, to draw our colored image onto with the right scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.main.scale)
        // get a reference to that context we created
        let context = UIGraphicsGetCurrentContext()!
        // set the fill color
        color.setFill()
        
        // translate/flip the graphics context (for transforming from CG* coords to UI* coords
        context.translateBy(x: 0, y: image.size.height);
        context.scaleBy(x: 1.0, y: -1.0);
        
        context.setBlendMode(.colorBurn);
        let rect = CGRect(x:0 ,y: 0, width: image.size.width, height: image.size.height)
        context.draw(image.cgImage!, in: rect)
        
        context.setBlendMode(.sourceIn)
        context.addRect(rect)
        context.drawPath(using: .fill)
        
        // generate a new UIImage from the graphics context we drew onto
        let coloredImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return the color-burned image
        return coloredImg!;

    }
    
    static func pinLocationMarker() -> UIImage {
        return AhamoveStyleKit.imageOfMapDestIcon(withFrame: CGRect(x: 0, y: 0, width: 44, height: 44), pin_color: UIColor(hexString: "#032553"), text_color: UIColor.black, number: "", fontSize: 16)
    }
    
    static func pinFromMapIcon(colorHex: String? = nil) -> UIImage {
        var colorCode = "#F05522"
        if let _colorHex = colorHex {
            colorCode = _colorHex
        }
        
        return AhamoveStyleKit.imageOfFromMarker(withFrame: CGRect(x: 0, y: 0, width: 20, height: 20), pin_color: UIColor(hexString: colorCode))
        
//        return AhamoveStyleKit.imageOfMapDestIcon(withFrame: CGRect(x: 0, y: 0, width: 44, height: 44), pin_color: UIColor(hexString: "#032553"), text_color: UIColor.black, number: "", fontSize: 16)
    }
    
    static func pin(fromDestIcon text: String, colorHex: String? = nil) -> UIImage {
        var colorCode = "#35343D"
        if let _colorHex = colorHex {
            colorCode = _colorHex
        }
        return AhamoveStyleKit.imageOfDestMarker(withFrame: CGRect(x: 0, y: 0, width: 20, height: 20), pin_color: UIColor(hexString: colorCode))
        
//        return AhamoveStyleKit.imageOfMapDestIcon(withFrame: CGRect(x: 0, y: 0, width: 44, height: 44), pin_color: UIColor(hexString: "#FB002B"), text_color: UIColor.black, number: text, fontSize: 16)
    }
    
    class func avatarImage(displayName: String, backgroundColor color: UIColor, textolor textColor: UIColor, font: UIFont, imageHeight: CGFloat, isRounded: Bool) -> UIImage {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageHeight, height: imageHeight))
        return imageView.imageSnapshot(fromText: displayName, backgroundColor: color, circular: isRounded, textAttributes: [NSFontAttributeName: font, NSForegroundColorAttributeName: textColor])
    }
    
    class func fbProfileImageUrl(fbId: String) -> String {
        return "https://graph.facebook.com/\(fbId)/picture?type=large"
    }
    
    //MARK:- TableView
    static func hideEmptyCellForTableView(tableView: UITableView) {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //MARK:- Currency
    static func moneyString(number: Double, currency: String, locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        
        var symbol: String
        
        if let currencySymbol = (locale as NSLocale).displayName(forKey: .currencySymbol, value: currency) {
            symbol = currencySymbol
        }
        else {
            symbol = currency
        }
        
        if number >= 0 {
            if let moneyString = formatter.string(from: NSNumber(value: number)) {
                return "\(symbol)\(moneyString)"
            }
            else {
                return "\(symbol)\(number)"
            }
            
        }
        else {
            if let moneyString = formatter.string(from: NSNumber(value: -number)) {
                return "- \(symbol)\(moneyString)"
            }
            else {
                return "- \(symbol)\(-number)"
            }
        }
        
    }
    
    static func getMoneyNumber(moneyString: String, currency: String?) -> Double? {
        if moneyString.count > 0 {
            var numberString = moneyString
            if let groupingSeparator = (Locale.current as NSLocale).object(forKey: NSLocale.Key.groupingSeparator) as? String {
                numberString = numberString.replacingOccurrences(of: groupingSeparator, with: "")
            }
            
            if let _currency = currency, _currency.count > 0 {
                if let currencySymbol = (Locale.current as NSLocale).displayName(forKey: NSLocale.Key.currencySymbol, value: _currency) {
                    numberString = numberString.replacingOccurrences(of: currencySymbol, with:"");
                }
                else {
                    numberString = numberString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "");
                }
            }
            
            let number = Double(numberString)
            return number
        }
        return nil;
    }
    
    //MARK:- Formatter
    static func getDistanceFormatter() -> NumberFormatter {
        let fmt = NumberFormatter()
        fmt.positiveFormat = "0.##"
        return fmt
    }
    
    static func getRatingFormatter() -> NumberFormatter {
        let fmt = NumberFormatter()
        fmt.positiveFormat = "0.#"
        return fmt
    }
    
    static func formatDate(date: Date) -> String {
        let dateString = date.string(custom: "MMM dd, hh:mm a")
        return dateString
    }
    
    static func mobileWithFormat(mobile: String, countryCode: String?) -> String {
        let phoneNumberKit = PhoneNumberKit()
        do {
            let phoneNumber = try phoneNumberKit.parse(mobile, withRegion: countryCode ?? PhoneNumberKit.defaultRegionCode(), ignoreType: false)
            return phoneNumberKit.format(phoneNumber, toType: .international)
        }
        catch {
            return mobile
        }
    }
    
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
    
    static func getTimeRangeString(start: Date, end: Date) -> String {
        var timeRange: TimeInterval
        if end > start {
            timeRange = DateTimeInterval(start: start, end: end).duration
        }
        else {
            timeRange = DateTimeInterval(start: end, end: start).duration
        }
        
        let compArray = timeRange.in([.day, .hour, .minute])
        
        var resultString = ""
        if let minute = compArray[.minute], minute > 0 {
            resultString = "\(minute) \("minutes".localized())"
        }
        if let hour = compArray[.hour], hour > 0 {
            resultString = "\(hour) \("hours".localized()) \(resultString)"
        }
        if let day = compArray[.day], day > 0 {
            resultString = "\(day) \("days".localized()) \(resultString)"
        }
        
        if resultString.count == 0 {
            resultString = "Now".localized()
        }
        else if end > start {
            resultString = "\(resultString) \("later".localized())"
        }
        else {
            resultString = "\(resultString) \("ago".localized())"
        }
        
        return resultString
    }
    
    //MARK:- Calling
    static func makeACall(number: String, isPrompt: Bool) {
        let trimmedString = number.replacingOccurrences(of: " ", with: "")
        let url: URL?
        if isPrompt {
            url = URL(string: "telprompt://\(trimmedString)")
        }
        else {
            url = URL(string: "tel://\(trimmedString)")
        }
        
        if let _url = url, UIApplication.shared.canOpenURL(_url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(_url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(_url)
            }
            return
        }
        AlertUtil.instance.showAlert(title: "Your device does not support calling".localized(), message: "\("Mobile number: ".localized()) \(trimmedString)")
    }
    
    //MARK:- View Corner
    static func makeViewRounded(view: UIView) {
        view.layer.cornerRadius = view.frame.size.height/2.0
    }
    
    static func getIntNumbersFromString(string: String) -> [Int] {
        var numberArray = [Int]()
        let regexPattern = "\\d+";   //"[\\d[.]]+" for float
        let regex = try! NSRegularExpression(pattern: regexPattern, options: [])
        let nsString = string as NSString
        
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: nsString.length))
        for match in matches {
            
            let strNumber = nsString.substring(with: match.range) as String
            if let number = Int(strNumber) {
                numberArray.append(number)
            }
        }
        
        return numberArray
    }
    
    //MARK:- Calculate width
    static func calculateWidth(text: String, font: UIFont, height: CGFloat, lineBreakMode: NSLineBreakMode) -> CGFloat {
        let attributes: [String: Any] = [NSFontAttributeName: font]
        // NSString class method: boundingRectWithSize:options:attributes:context is
        // available only on ios7.0 sdk.
        let rect: CGRect = text.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size.width
    }
    
    //MARK:- Google Map
    class func getGMSBoundsWithRadius(inMeters radius: Double, centerCoord center: CLLocationCoordinate2D) -> GMSCoordinateBounds {
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(center, radius * 2, radius * 2)
        let northEast: CLLocationCoordinate2D = CLLocationCoordinate2DMake(region.center.latitude - region.span.latitudeDelta / 2, region.center.longitude - region.span.longitudeDelta / 2)
        let southWest: CLLocationCoordinate2D = CLLocationCoordinate2DMake(region.center.latitude + region.span.latitudeDelta / 2, region.center.longitude + region.span.longitudeDelta / 2)
        let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        return bounds
    }
    
    //MARK:- String
    static func isEmptyString (_ string: String?) -> Bool{
        if let _string = string, _string.count > 0 {
            return false
        }
        else {
            return true
        }
    }
    
    class func getFistCharacters(in fullString: String) -> String {
        var firstCharacters = ""
        let words = fullString.components(separatedBy: CharacterSet.whitespaces)
        for word: String in words {
            if word.count > 0 {
                let firstLetter: String? = (word as NSString).substring(to: 1)
                firstCharacters += (firstLetter?.uppercased())!
            }
        }
        return firstCharacters
    }
    
    //Ignore case
    class func containString(from parentString: String, subString: String) -> Bool {
        let searchString = parentString.lowercased().replacingOccurrences(of: "đ", with: "d")
        let scanString = subString.lowercased().replacingOccurrences(of: "đ", with: "d")

        if let _ = searchString.range(of: scanString, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: Locale.current) {
            return true
        }
        else {
            return false
        }
    }

    class func ranges(from patternString: String, subString: String) -> [NSRange] {
        let searchString = patternString.lowercased().replacingOccurrences(of: "đ", with: "d").folding(options: .diacriticInsensitive, locale: Locale.current)
        let scanString = subString.lowercased().replacingOccurrences(of: "đ", with: "d").folding(options: .diacriticInsensitive, locale: Locale.current)
        let nsSearchString = NSString(string: searchString)
        do {
            let regex = try NSRegularExpression(pattern: scanString, options: NSRegularExpression.Options.caseInsensitive)
            let results = regex.matches(in: searchString, options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                      range: NSRange(location: 0, length: nsSearchString.length))
            return results.map({ return $0.range })
        } catch {
            print("Error: \(error.localizedDescription)")
            return []
        }
    }

    class func distanceBetween(firstCoord: CLLocationCoordinate2D, secondCoord: CLLocationCoordinate2D) -> CLLocationDistance {
        let meters: CLLocationDistance = CLLocation(latitude: firstCoord.latitude, longitude: firstCoord.longitude).distance(from: CLLocation(latitude: secondCoord.latitude, longitude: secondCoord.longitude))
        return meters
    }
    
    class func calculateAngle(fromLocation: CLLocationCoordinate2D, toLocation: CLLocationCoordinate2D) -> CLLocationDirection {
        let deltaY = Double((toLocation.longitude - fromLocation.longitude))
        let deltaX = Double((toLocation.latitude - fromLocation.latitude))
        let angleInDegrees: Double = atan2(deltaY, deltaX) * 180 / .pi
        return angleInDegrees
    }
}
