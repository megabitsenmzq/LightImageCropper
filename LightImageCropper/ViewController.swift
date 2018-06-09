//
//  ViewController.swift
//  LightImageCropper
//
//  Created by Jinyu Meng on 2018/6/9.
//

import UIKit

class ViewController: UIViewController, LImagePickerDelegate {

    var imagePicker = LImagePicker()
    
    @IBOutlet var imageView: UIImageView!
    @IBAction func selectAndCrop(_ sender: Any) {
        present(imagePicker.imagePickerController, animated: true, completion: nil)
    }
    
    func imagePicker(imagePicker: LImagePicker, pickedImage: UIImage) {
        imageView.image = pickedImage
    }
    
    func imagePickerDidCancel(imagePicker: LImagePicker) {
        print("Canceled")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
}

