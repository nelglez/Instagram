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

class SignupViewModel {
    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping (_ user: User) -> Void) {
        AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed)
    }
}
