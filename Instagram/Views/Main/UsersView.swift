//
//  UsersView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/4/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import URLImage

struct UsersView: View {
    @ObservedObject var usersViewModel = UsersViewModel()
   
    
    var body: some View {
        VStack {
            SearchBar(text: $usersViewModel.searchText, onSearchButtonChanged: usersViewModel.searchTextDidChange)
            List {
                if !usersViewModel.isLoading {
                    ForEach(usersViewModel.users, id: \.uid) { user in
                        NavigationLink(destination: UserProfileView(userData: user)) {
                            HStack {
                                URLImage(URL(string: user.profileImageUrl)!, content: {
                                    $0.image.resizable().aspectRatio(contentMode: .fill).clipShape(Circle())
                                }).frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(user.username).font(.headline).bold()
                                    Text("iOS Developer").font(.subheadline)
                                }
                                
                            }.padding(10)
                        }
                        
                    }
                }
            }
        }.navigationBarTitle("Search", displayMode: .inline)
    }
    
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
