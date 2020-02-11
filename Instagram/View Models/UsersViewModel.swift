//
//  UsersViewModel.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/11/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    var searchText = ""
    
    func searchTextDidChange() {
        isLoading = true
        Api.User.searchUsers(text: searchText) { (users) in
            self.isLoading = false
            self.users = users
        }
    }
}
