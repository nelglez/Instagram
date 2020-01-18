//
//  ImagePickerController.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/16/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var showImagePicker: Bool
    @Binding var pickedImage: Image
    @Binding var imageData: Data
   
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
       // imagePicker.sourceType = .photoLibrary
       // imagePicker.allowsEditing = true
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //Can be used to initialize initial values and its called right after the makeUIViewController method completes its task.
    }
    
    func makeCoordinator() -> Coordinator {
        //To implement the necessary delegates / datasource or other classes
        Coordinator(self)
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parentImagePicker: ImagePicker
        
        init(_ imagePicker: ImagePicker) {
            self.parentImagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[.originalImage] as! UIImage
            
            parentImagePicker.pickedImage = Image(uiImage: uiImage)
            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
                parentImagePicker.imageData = mediaData
            }
            parentImagePicker.showImagePicker = false
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parentImagePicker.showImagePicker = false
        }
    }
    
}


