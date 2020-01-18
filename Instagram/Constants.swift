//
//  Constants.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage

let COLOR_LIGHT_GRAY = Color(red: 0, green: 0, blue: 0, opacity: 0.15)

//Sign in and Sign up pages
let TEXT_NEED_AN_ACCOUNT = "Don't have an account?"
let TEXT_SIGN_UP = "Sign up"
let TEXT_SIGN_IN = "Sign in"
let TEXT_EMAIL = "Email"
let TEXT_PASSWORD = "Password"
let TEXT_SIGNIN_HEADLINE = "Photo Sharing"
let TEXT_SIGNIN_SUBHEADLINE = "The easy way to share photos with family and friends"
let TEXT_USERNAME = "Username"
let TEXT_SIGNUP_NOTE = "An account will allow you to save and access photo information across devices. You can delete you account at any time and your information will not be shared."
let TEXT_SIGNUP_PASSWORD_REQUIRED = "At least 8 characters required."

let IMAGE_LOGO = "logo"
let IMAGE_USER_PLACEHOLDER = "user-placeholder"

/*
class Ref {
    //Storage
    static var STORAGE_ROOT = Storage.storage().reference()
    static var STORAGE_AVATAR = STORAGE_ROOT.child("avatar")
    static func STORAGE_AVATAR_USERID(userId: String) -> StorageReference {
        return STORAGE_AVATAR.child(userId)
    }
    
    //Firestore
    static var FIRESTORE_ROOT = Firestore.firestore()
    static var FIRESTORRE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
    static func FIRESTORE_DOCUMENT_USERID(userId: String) -> DocumentReference {
        return FIRESTORRE_COLLECTION_USERS.document(userId)
    }
}
*/
