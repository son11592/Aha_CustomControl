//
//  PickPhotoUtil.swift
//  Driver
//
//  Created by DuongNgoAnh on 3/8/17.
//  Copyright © 2017 AhaMove. All rights reserved.
//

import UIKit
import XLActionController
import MobileCoreServices

class PickPhotoUtil: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    static var instance = PickPhotoUtil()
    
    let picker = UIImagePickerController()
    var successBlock :((_ image: UIImage)->Void)? = nil
    var cancelBlock :(()->Void)? = nil
    
    override init() {
        super.init()
        picker.delegate = self
    }
    
    func getPickerPhoto(sourceView: UIView,
                        success: @escaping (_ image: UIImage)->Void,
                        cancel: @escaping ()->Void) {
        successBlock = success
        cancelBlock = cancel
        
        showActionBar(sourceView: sourceView)
    }
    
    private func showActionBar(sourceView: UIView) {
        let actionController = SkypeActionController()
        actionController.addAction(Action("Take photo".localized(), style: .default, handler: { [weak self] action in
            self?.shootPhoto(sourceView: sourceView)
        }))
        actionController.addAction(Action("Choose photo".localized(), style: .default, handler: { [weak self] action in
            self?.photoFromLibrary(sourceView: sourceView)
        }))
        actionController.addAction(Action("Cancel".localized(), style: .cancel, handler: nil))
        
        actionController.presenter().present()
        
    }
    
    func getPickerPhoto(fromCamera: Bool,
                        sourceView: UIView,
                        success: @escaping (_ image: UIImage)->Void,
                        cancel: @escaping ()->Void) {
        successBlock = success
        cancelBlock = cancel
        
        if fromCamera {
            self.shootPhoto(sourceView: sourceView)
        }
        else {
            self.photoFromLibrary(sourceView: sourceView)
        }
    }
    
    private func photoFromLibrary(sourceView: UIView) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        picker.allowsEditing = true
        picker.presenter().present()
        
        let ppc = picker.popoverPresentationController
        ppc?.sourceView = sourceView
    }
    
    private func shootPhoto(sourceView: UIView) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            picker.allowsEditing = true
            picker.mediaTypes = [kUTTypeImage as String]
            picker.presenter().present()
        } else {
            noCamera()
            successBlock = nil
            cancelBlock = nil
        }
    }
    
    private func noCamera(){
        AlertUtil.instance.showAlert(title: "No Camera".localized(), message: "This device has no camera".localized())
    }
    
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.close(animated: true, completion: nil)
        if let chosenImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            let squareImage = RBSquareImage(image: chosenImage)
            
            if successBlock != nil {
                successBlock!(squareImage)
            }
            successBlock = nil
            cancelBlock = nil
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.close(animated: true, completion: nil)
        if cancelBlock != nil {
            cancelBlock!()
        }
        
        successBlock = nil
        cancelBlock = nil
    }
}

