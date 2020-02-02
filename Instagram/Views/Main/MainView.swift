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
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.fill")
            }.tag(0)
            SearchView().tabItem({
                Image(systemName: "magnifyingglass")
            }).tag(1)
            CameraView().tabItem({
                Image(systemName: "camera.viewfinder")
            }).tag(2)
            NotificationView().tabItem({
                Image(systemName: "heart.fill")
            }).tag(3)
            Text("Profile View").tabItem({
                Image(systemName: "person.fill")
            }).tag(4)
        }.accentColor(.black)
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
