//
//  LImagePicker.swift
//  LImagePicker
//
//  Created by Jinyu Meng on 2018/6/9.
//  Copyright © 2018年 Jinyu Meng. All rights reserved.
//

import UIKit

public protocol LImagePickerDelegate {
     func imagePicker(imagePicker: LImagePicker, pickedImage: UIImage)
     func imagePickerDidCancel(imagePicker: LImagePicker)
}

public class LImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, LImageCropControllerDelegate {
    
    public var delegate: LImagePickerDelegate?
    public var cropSize: CGSize!

    private var _imagePickerController: UIImagePickerController!

    public var imagePickerController: UIImagePickerController {
        return _imagePickerController
    }
    
    override public init() {
        super.init()

        self.cropSize = CGSize(width:320, height:320)
        _imagePickerController = UIImagePickerController()
        _imagePickerController.delegate = self
        _imagePickerController.sourceType = .photoLibrary
        _imagePickerController.modalTransitionStyle = .crossDissolve
    }

    private func hideController() {
        self._imagePickerController.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        if self.delegate?.imagePickerDidCancel != nil {
            self.delegate?.imagePickerDidCancel(imagePicker: self)
        } else {
            self.hideController()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let cropController = LImageCropViewController()
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageSize = image.size
        let safeArea = CGSize(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.83)
        let widthScale = safeArea.width / imageSize.width
        let heightScale = safeArea.height / imageSize.height
        var scale: CGFloat = 1.0
        if widthScale > 0 {
            if heightScale > 0 {
                scale = min(widthScale, heightScale)
            } else {
                scale = heightScale
            }
        } else {
            if heightScale > 0 {
                scale = widthScale
            } else {
                scale = max(widthScale, heightScale)
            }
        }
        cropSize = CGSize(width: imageSize.width * scale, height: imageSize.height * scale)
        cropController.sourceImage = image
        cropController.cropSize = self.cropSize
        cropController.delegate = self
        picker.pushViewController(cropController, animated: true)
    }
    
    func imageCropController(imageCropController: LImageCropViewController, didFinishWithCroppedImage croppedImage: UIImage) {
        self.delegate?.imagePicker(imagePicker: self, pickedImage: croppedImage)
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
}
