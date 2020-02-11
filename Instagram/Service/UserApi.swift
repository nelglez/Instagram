//
//  UserApi.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/11/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import FirebaseAuth

class UserApi {
    func searchUsers(text: String, onSuccess: @escaping (_ users: [User]) -> Void) {
        Ref.FIRESTORRE_COLLECTION_USERS.whereField("keywords", arrayContains: text.lowercased()).getDocuments { (snapshot, error) in
            guard let snap = snapshot else {
                print("Error fetching data")
                return
            }
            
            var users = [User]()
            
            for document in snap.documents {
                let dict = document.data()
                guard let decodedUser = try? User(fromDictionary: dict) else { return }
                //We dont want to display the login user.
                if decodedUser.uid != Auth.auth().currentUser?.uid {
                    users.append(decodedUser)
                }
            }
            
            onSuccess(users)
        }
    }
}
