//
//  ProfileHeader.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        HStack {
            Image("photo").resizable().clipShape(Circle()).scaledToFill().frame(width: 80, height: 80).padding(.leading, 20)
            Spacer()
            VStack {
                Text("50").font(.headline)
                Text("Posts").font(.subheadline)
            }.padding(10)
            VStack {
                Text("100").font(.headline)
                Text("Followers").font(.subheadline)
            }.padding(10)
            VStack {
                Text("200").font(.headline)
                Text("Following").font(.subheadline)
            }.padding(10)
            Spacer()
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
