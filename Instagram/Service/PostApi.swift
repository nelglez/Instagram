//
//  PostApi.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 3/9/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

class PostApi {
    func uploadPost(caption: String, imageData: Data ,onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let postId = Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document().documentID
        let storagePostRef = Ref.STORAGE_POST_ID(postId: postId)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metaData: metaData, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
    }
    
    
}

