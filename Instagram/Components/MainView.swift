//
//  MainView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/24/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        Group {
            Text((session.userSession == nil) ? "Loading..." : session.userSession!.email)
            Button(action: logOut) {
                Text("Log out")
            }
        }
    }
    
    private func logOut() {
        session.logOut()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
