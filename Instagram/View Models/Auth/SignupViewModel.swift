//
//  SignupViewModel.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/18/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SignupViewModel: ObservableObject {
    var username = ""
    var email = ""
    var password = ""
    var image: Image = Image(IMAGE_USER_PLACEHOLDER)
    var imageData: Data = Data()
    var errorString = ""
    
    @Published var showAlert = false
    @Published var showImagePicker = false
    
    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty && imageData.isEmpty {
        AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields."
        }
    }
}
