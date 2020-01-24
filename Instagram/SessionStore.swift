//
//  SessionStore.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/24/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth
import Firebase

class SessionStore: ObservableObject {
    @Published var isLoggedIn = false
    @Published var userSession: User?
    
    var handle: AuthStateDidChangeListenerHandle?
    
    func listenAuthenticationState() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print(user.email)
                
                let firestoreRoot = Firestore.firestore()
                let firestoreUsers = firestoreRoot.collection("users")
                let firestoreUserId = firestoreUsers.document(user.uid)
                
                firestoreUserId.getDocument { (document, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                     //   onError(error!.localizedDescription)
                        return
                    }
                    if let dict = document?.data() {
                        guard let decodedUser = try? User(fromDictionary: dict) else { return }
                    //    onSuccess(decodedUser)
                        self.userSession = decodedUser
                    }
                }
                self.isLoggedIn = true
            } else {
                print("isLoggedIn is false")
                self.isLoggedIn = false
                self.userSession = nil
            }
        })
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
//Stop listening for auth changes
    func unbind() {
       if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
