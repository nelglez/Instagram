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

class SessionStore: ObservableObject {
    @Published var isLoggedIn = false
    var handle: AuthStateDidChangeListenerHandle?
    
    func listenAuthenticationState() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print(user.email)
                self.isLoggedIn = true
            } else {
                print("isLoggedIn is false")
                self.isLoggedIn = false
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
