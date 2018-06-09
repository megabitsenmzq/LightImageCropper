# LightImageCropper

A light weight image cropper written in swift. 

- Very light weight.
- Use with built in UIImagePicker.
- Crop area is limited to image size.

Edit from [WDImagePicker](https://github.com/justwudi/WDImagePicker) 

## Installation

- Copy the files under "LightImageCropperClasses" into your project.
- look at the sample code below.

## Sample Code

First add "LImagePickerDelegate" to the class.

Then Add these to the class:

```swift
let imagePicker = LImagePicker()

func imagePicker(imagePicker: LImagePicker, pickedImage: UIImage) {
    //do thing with image.
}
    
func imagePickerDidCancel(imagePicker: LImagePicker) {
    print("Canceled")
}
```

Then Show the picker:

```swift
imagePicker.delegate = self

present(imagePicker.imagePickerController, animated: true, completion: nil)
```

![Sample Crop Image](https://raw.githubusercontent.com/megabitsenmzq/LightImageCropper/master/screenshot.png)

## License
Under MIT. See license file for details.



