//
//  CameraViewModel.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 3/9/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI


class CameraViewModel: ObservableObject {
    
    var caption = ""
    var image: Image = Image(systemName: IMAGE_PHOTO)
    var imageData: Data = Data()
    var errorString = ""
    
    @Published var showAlert = false
    @Published var showImagePicker = false
    
    func sharePost(completed: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !caption.isEmpty && !imageData.isEmpty {
            Api.Post.uploadPost(caption: caption, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields."
        }
    }
}
