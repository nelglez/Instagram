//
//  StorageService.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/18/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import Firebase


class StorageService {
    static func saveAvatar(userId: String, username: String, email: String, imageData: Data, metaData: StorageMetadata, storageAvatarRef: StorageReference, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        storageAvatarRef.putData(imageData, metadata: metaData) { (storageMetadata, error) in
              if error != nil {
                  print(error!.localizedDescription)
                onError(error!.localizedDescription)
                  return
              }
              
              storageAvatarRef.downloadURL { (url, error) in
                  if error != nil {
                      print(error!.localizedDescription)
                    onError(error!.localizedDescription)
                      return
                  }
                  
                  if let metaImageUrl = url?.absoluteString {
                      if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                          changeRequest.photoURL = url
                          changeRequest.displayName = username
                          changeRequest.commitChanges { (error) in
                              if error != nil {
                                  print(error!.localizedDescription)
                                onError(error!.localizedDescription)
                                  return
                              }
                          }
                      }
                      
                      let firestoreRoot = Firestore.firestore()
                      let firestoreUsers = firestoreRoot.collection("users")
                      let firestoreUserId = firestoreUsers.document(userId)
                      //   let userInfo = ["username": self.username, "email": self.email, "profileImageUrl": metaImageUrl]
                      
                    let user = User(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, bio: "", keywords: username.splitStringToArray())
                      
                      // let dict = user.dict //Old way without encodable extension
                      guard let dict = try? user.toDictionary() else { return }
//                      guard let decodedUser = try? User(fromDictionary: dict) else { return }
//                      print(decodedUser.username)
//                      firestoreUserId.setData(dict)
                    firestoreUserId.setData(dict) { (error ) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                        
                        onSuccess(user)
                    }
                      
                  }
              }
          }
    }
    
    static func savePostPhoto(userId: String, caption: String, postId: String, imageData: Data, metaData: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
            storagePostRef.putData(imageData, metadata: metaData) { (storageMetadata, error) in
                  if error != nil {
                      print(error!.localizedDescription)
                    onError(error!.localizedDescription)
                      return
                  }
                  
                  storagePostRef.downloadURL { (url, error) in
                      if error != nil {
                          print(error!.localizedDescription)
                        onError(error!.localizedDescription)
                          return
                      }
                      
                      if let metaImageUrl = url?.absoluteString {
                         let fireStorePostRef = Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document(postId)
                        let post = Post(caption: caption, likes: [:], location: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, avatar: Auth.auth().currentUser!.photoURL!.absoluteString, mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
                          
                          // let dict = user.dict //Old way without encodable extension
                          guard let dict = try? post.toDictionary() else { return }
    //                      guard let decodedUser = try? User(fromDictionary: dict) else { return }
    //                      print(decodedUser.username)
    //                      firestoreUserId.setData(dict)
                        fireStorePostRef.setData(dict) { (error ) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                            //Save post into the timeline of the logged in user
                            Ref.FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: userId).collection("timeline").document(postId).setData(dict)
                            Ref.FIRESTORE_COLLECTION_ALL_POSTS.document(postId).setData(dict)
                            onSuccess()
                        }
                          
                      }
                  }
              }
        }
}
