//
//  MessagesView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/5/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        NavigationView {
                   List {
                       ForEach(0..<10) { _ in
                           HStack {
                               Image("photo1").resizable().clipShape(Circle()).frame(width: 50, height: 50)
                               VStack(alignment: .leading, spacing: 5) {
                                   Text("David").font(.headline).bold()
                                Text("Share a new photo Share a new photo Share a new photo Share a new photo").font(.subheadline).lineLimit(2)
                               }
                               Spacer()
                            VStack(spacing: 5) {
                               Text("1:00").bold()
                                Text("2").padding(8).background(Color.blue).foregroundColor(.white).clipShape(Circle())
                            }
                           }.padding(10)
                       }
                       
                   }.navigationBarTitle("Messages", displayMode: .inline)
               }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
