//
//  AuthService.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/18/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage

class AuthService {
    
    static func signupUser(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            guard let userId = authData?.user.uid else { return }
            
            let storageRoot = Storage.storage().reference()
            let storageAvatar = storageRoot.child("avatar")
            let storageAvatarUserId = storageAvatar.child(userId)
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            StorageService.saveAvatar(userId: userId, username: username, email: email, imageData: imageData, metaData: metaData, storageAvatarRef: storageAvatarUserId, onSuccess: onSuccess, onError: onError)
            
//            storageAvatarUserId.putData(imageData, metadata: metaData) { (storageMetadata, error) in
//                if error != nil {
//                    print(error!.localizedDescription)
//                    return
//                }
//
//                storageAvatarUserId.downloadURL { (url, error) in
//                    if error != nil {
//                        print(error!.localizedDescription)
//                        return
//                    }
//
//                    if let metaImageUrl = url?.absoluteString {
//                        if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
//                            changeRequest.photoURL = url
//                            changeRequest.displayName = username
//                            changeRequest.commitChanges { (error) in
//                                if error != nil {
//                                    print(error!.localizedDescription)
//                                    return
//                                }
//                            }
//                        }
//
//                        let firestoreRoot = Firestore.firestore()
//                        let firestoreUsers = firestoreRoot.collection("users")
//                        let firestoreUserId = firestoreUsers.document(userId)
//                        //   let userInfo = ["username": self.username, "email": self.email, "profileImageUrl": metaImageUrl]
//
//                        let user = User(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, bio: "", keywords: [])
//
//                        // let dict = user.dict //Old way without encodable extension
//                        guard let dict = try? user.toDictionary() else { return }
//                        guard let decodedUser = try? User(fromDictionary: dict) else { return }
//                        print(decodedUser.username)
//                        firestoreUserId.setData(dict)
//
//                    }
//                }
//            }
        }
    }
    
    
    static func signinUser(email: String, password: String, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            let firestoreRoot = Firestore.firestore()
            let firestoreUsers = firestoreRoot.collection("users")
            let firestoreUserId = firestoreUsers.document(userId)
            
            firestoreUserId.getDocument { (document, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    onError(error!.localizedDescription)
                    return
                }
                if let dict = document?.data() {
                    guard let decodedUser = try? User(fromDictionary: dict) else { return }
                    onSuccess(decodedUser)
                }
            }
            
        }
        
    }
    
}
