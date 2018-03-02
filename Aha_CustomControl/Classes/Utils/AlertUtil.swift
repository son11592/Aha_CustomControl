//
//  AlertUitl.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/6/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit

class PendingAlert: NSObject {
    var _title: String?
    var _message: String?
    var _imageUrl: String?
    var _alertGroup: String?
    
    init(title: String?, message: String?, imageUrl: String? = nil, alertGroup: String? = nil) {
        _title = title
        _message = message
        _imageUrl = imageUrl
        _alertGroup = alertGroup
    }
}

class AlertUtil: NSObject {
    static let instance = AlertUtil()
    var alertDictionary = Dictionary<String, CDAlertView>()
    var pendingAlerts = [PendingAlert]()
    var pendingNews = [NotificationNews]()
    
    func registerAlert(alert: CDAlertView, key: String) {
        alertDictionary[key] = alert
    }
    
    func unRegisterAlertForKey(key: String) {
        alertDictionary[key] = nil
    }
    
    func isKeyAlertRegistered(key: String) -> Bool {
        if alertDictionary[key] != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func getKeyForNews(news: NotificationNews) -> String {
        let keyAlert = String(format: "__%@__%@__%@__%@__%@",
                              news.title,
                              news.message,
                              news.url ?? "",
                              news.promo_code ?? "",
                              news.image_url ?? "")
        
        return keyAlert
    }
    
    func isNewsRead(news: NotificationNews) -> Bool {
        let userDefaults = UserDefaults.standard
        
        if let arrayOfReadNewsKey = userDefaults.object(forKey: "ReadNewsKey") as? [String] {
            if arrayOfReadNewsKey.contains(AlertUtil.instance.getKeyForNews(news: news)) {
                return true
            }
        }
        return false
    }
    
    func showAlert(news: NotificationNews) {
        let applicationState = UIApplication.shared.applicationState
        if applicationState == .active {
            let keyAlert = self.getKeyForNews(news: news)
            
            if self.isKeyAlertRegistered(key: keyAlert) {
                return
            }
            
            let alert = CDAlertView(title: news.title, message: news.message, type: .none)
            
            if let _imageUrl = news.image_url,
                let url = URL(string: _imageUrl) {
                
                let imageView = UIImageView(frame: .zero)
                imageView.contentMode = .scaleAspectFit
                imageView.af_setImage(withURL: url)
                
                imageView.addConstraint(NSLayoutConstraint(item: imageView,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .height,
                                                           multiplier: 16.0/9.0,
                                                           constant: 0))
                
                alert.customView = imageView
            }
            
            if let _url = news.url {
                alert.add(action: CDAlertViewAction(title: "Cancel".localized(), handler: {_ in
//                    TrackUtil.instance.trackEvent(
//                        screenName: "News", event: "News_dialog_cancel_btn",
//                        extraProperties: nil)
                }))
                let learnMoreAction = CDAlertViewAction(title: "Learn more".localized(), handler: { _ in
//                    TrackUtil.instance.trackEvent(
//                        screenName: "News", event: "News_dialog_learn_more_btn",
//                        extraProperties: nil)

                    //Store read news
                    let userDefaults = UserDefaults.standard
                    
                    if var arrayOfReadNewsKey = userDefaults.object(forKey: "ReadNewsKey") as? [String] {
                        arrayOfReadNewsKey.append(keyAlert)
                        userDefaults.set(arrayOfReadNewsKey, forKey:"ReadNewsKey")
                    }
                    else {
                        userDefaults.set([keyAlert], forKey:"ReadNewsKey")
                    }
                    
                    userDefaults.synchronize()
                    
                    NotificationCenter.default.post(name: Notification.Name("CheckUnreadNews"), object: nil)
                    
                    if let _ = URL(string: _url) {
                        //Show url by learn more
                        let webVC = WebVC()
                        webVC.viewTitle = news.title
                        webVC.pageUrlString = _url
                        webVC.presenter().present()
                    }
                    else {
                        self.showAlert(title: nil, message: "URL not exist".localized())
                    }
                    
                })
                alert.add(action: learnMoreAction)
            }
            else {
                //Store read news
                let userDefaults = UserDefaults.standard
                
                if var arrayOfReadNewsKey = userDefaults.object(forKey: "ReadNewsKey") as? [String] {
                    arrayOfReadNewsKey.append(keyAlert)
                    userDefaults.set(arrayOfReadNewsKey, forKey:"ReadNewsKey")
                }
                else {
                    userDefaults.set([keyAlert], forKey:"ReadNewsKey")
                }
                
                userDefaults.synchronize()
                NotificationCenter.default.post(name: Notification.Name("CheckUnreadNews"), object: nil)
                
                alert.add(action: CDAlertViewAction(title: "OK".localized(), handler: {_ in
//                    TrackUtil.instance.trackEvent(
//                        screenName: "News", event: "News_dialog_ok_btn",
//                        extraProperties: nil)
                }))
            }
            
            registerAlert(alert: alert, key: keyAlert)
            alert.show { [weak self] alert in
                self?.unRegisterAlertForKey(key: keyAlert)
            }
        }
        else {
            pendingNews.append(news)
        }
    }
    
    func showAlert(title: String?, message: String?, imageUrl: String? = nil, alertGroup: String? = nil) {
        let applicationState = UIApplication.shared.applicationState
        if applicationState == .active {
            var keyAlert: String
            
            if alertGroup != nil && (alertGroup?.count)! > 0 {
                keyAlert = alertGroup!
            }
            else {
                keyAlert = String(format: "__%@__%@__%@",
                                  title ?? "",
                                  message ?? "",
                                  imageUrl ?? "")
            }
            
            if self.isKeyAlertRegistered(key: keyAlert) {
                if alertGroup != nil && (alertGroup?.count)! > 0 {
                    let alert = alertDictionary[keyAlert]
                    alert?.hide(isPopupAnimated: false)
                }
                else {
                    return
                }
            }
            
            let alert = CDAlertView(title: title, message: message, type: .none)
            
            if let _imageUrl = imageUrl,
                let url = URL(string: _imageUrl) {
                
                let imageView = UIImageView(frame: .zero)
                imageView.contentMode = .scaleAspectFit
                imageView.af_setImage(withURL: url)
                
                imageView.addConstraint(NSLayoutConstraint(item: imageView,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .height,
                                                           multiplier: 16.0/9.0,
                                                           constant: 0))
                
                alert.customView = imageView
            }
            alert.add(action: CDAlertViewAction(title: "OK".localized()))
            
            registerAlert(alert: alert, key: keyAlert)
            alert.show { [weak self] alert in
                self?.unRegisterAlertForKey(key: keyAlert)
            }
        }
        else {
            let pendingAlert = PendingAlert(title: title, message: message, imageUrl: imageUrl, alertGroup: alertGroup)
            pendingAlerts.append(pendingAlert)
        }
    }
    
    func processPendingAlert() {
        let applicationState = UIApplication.shared.applicationState
        if applicationState == .active {
            for alert in pendingAlerts {
                self.showAlert(title: alert._title, message: alert._message, imageUrl: alert._imageUrl, alertGroup: alert._alertGroup)
            }
            pendingAlerts.removeAll()
            
            for news in pendingNews {
                self.showAlert(news: news)
            }
            pendingNews.removeAll()
        }
    }
}

