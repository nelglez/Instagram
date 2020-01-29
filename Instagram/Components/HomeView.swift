//
//  HomeView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                ScrollViewStory().padding(.trailing, -10)
                ForEach(1..<20) { _ in
                    HeaderCell()
                    FooterCell()
                }
            }.navigationBarTitle("Instagram", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HeaderCell: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("photo1").resizable().clipShape(Circle()).frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text("David").bold()
                    Text("Location").font(.caption)
                }
                Spacer()
                Image(systemName: "ellipsis").padding(.trailing, 16)
            }
            Image("photo2").resizable().scaledToFit().frame(width: UIScreen.main.bounds.size.width, height: 300).clipped().padding(.leading, -16)
        }
    }
}

struct FooterCell: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "bubble.left")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark.fill")
            }
            
            HStack {
                Text("David").font(.subheadline).bold()
                Text("Black and white").font(.subheadline)
            }
            
            Text("View all comments").font(.caption).foregroundColor(.gray)
            
            HStack {
                Image("photo1").resizable().clipShape(Circle()).frame(width: 25, height: 25)
                Text("Add a comment...").font(.caption).foregroundColor(.gray)
                Spacer()
                Text("❤️")
                Text("👏")
                Image(systemName: "plus.circle").foregroundColor(.gray)
            }
            
            Text("1 day ago").font(.caption).foregroundColor(.gray)
        }
    }
}
