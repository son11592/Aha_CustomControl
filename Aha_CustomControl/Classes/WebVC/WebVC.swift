//
//  WebVC.swift
//  Driver
//
//  Created by DuongNgoAnh on 5/3/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import HandySwift

class WebVC: UIViewController {
    
    @IBOutlet weak var topBarView: TopBarView!
    @IBOutlet var pageWebView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewTitle: String?
    var pageUrlString: String?
    
    var scaleHeight :CGFloat {
        get {
            return UIScreen.main.bounds.size.height / 667.0
        }
    }
    
    convenience init() {
        self.init(nibName: "WebVC", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topBarView.backButton.addTarget(self, action: #selector(backButtonDidTouch), for: .touchUpInside)
        topBarView.backButton.tintColor = UIColor.black
        
        topBarView.titleLabel.text = viewTitle
        topBarView.titleLabel.textColor = UIColor.black
        topBarView.titleLabel.numberOfLines = 2
        
        if let _pageUrlString = pageUrlString {
            if _pageUrlString.range(of: "http") != nil {
                pageWebView.loadRequest(URLRequest(url: URL(string: _pageUrlString)!))
            }
            else {
                pageWebView.loadRequest(URLRequest(url: URL(string: "https://\(_pageUrlString)")!))
            }
        }
        updateScaling()
    }
    
    func updateScaling() {
        delay(by: 0.1) {
            let image = UIImage(named: "close_icon")
            if let aspectScaledToFitImage = image?.af_imageAspectScaled(toFit: self.topBarView.backButton.frame.size) {
                self.topBarView.backButton.setImage(Utils.image(by: aspectScaledToFitImage, with: UIColor.black), for: .normal)
            }
            self.topBarView.titleLabel.setTextStyling(style: .lalaStyleH4)
        }
    }

    deinit {
        pageWebView.delegate = nil
    }
    
    //MARK:- IBAction
    func backButtonDidTouch() {
        self.close()
    }

}

//MARK:- UIWebViewDelegate
extension WebVC: UIWebViewDelegate {
    public func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        activityIndicator.stopAnimating()
    }
}
