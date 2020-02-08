//
//  UsersView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/4/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct UsersView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, onSearchButtonChanged: searchTextDidChange)
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image("photo1").resizable().clipShape(Circle()).frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("David").font(.headline).bold()
                            Text("iOS Developer").font(.subheadline)
                        }
                        
                    }.padding(10)
                }
                
            }
        }.navigationBarTitle("Search", displayMode: .inline)
    }
    func searchTextDidChange() {
        print("Search Text did change")
        print(searchText)
        //Find Users...
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
