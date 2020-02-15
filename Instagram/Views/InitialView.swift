//
//  InitialView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/24/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import Firebase

struct InitialView: View {
  @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Group {
            if (Auth.auth().currentUser != nil) {
           // if session.isLoggedIn {
                MainView()
            } else {
                SigninView()
            }
        }.onAppear(perform: listen)
    }
    
   private func listen() {
    session.listenAuthenticationState()
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
