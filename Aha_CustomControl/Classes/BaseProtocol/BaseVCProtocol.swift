//
//  BaseVCProtocol.swift
//  ahamove
//
//  Created by DuongNgoAnh on 10/1/17.
//  Copyright © 2017 ahamove. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

public protocol BaseVCProtocol {
    
    func customInitLayout()
    func updateScaling()
    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    
}
