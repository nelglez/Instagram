//
//  ChatView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/5/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading) {
                        ChatRow(isCurrentUser: false)
                        ChatRow(isCurrentUser: true)
                        ChatRow(isCurrentUser: true, isPhoto: true)
                    }.padding(.top, 20)
                }
            }.navigationBarTitle("Chat", displayMode: .inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ChatRow: View {
    var isCurrentUser = false
    var isPhoto = false
    
    
    var body: some View {
        Group {
            if !isCurrentUser && !isPhoto {
                HStack(alignment: .top) {
                    Image("photo").resizable().scaledToFill().frame(width: 30, height: 30).clipShape(Circle())
                    Text("Hi guys").padding(10).foregroundColor(.black).background(Color(red: 237/255, green: 237/255, blue: 237/255)).cornerRadius(10).font(.callout)
                }.padding(.leading, 15).padding(.trailing, 50)
            } else if !isPhoto {
                HStack(alignment: .top) {
                    Spacer(minLength: 50)
                    Text("Hi guys").padding(10).foregroundColor(.white).background(Color.blue).cornerRadius(10).font(.callout)
                }.padding(.trailing, 15)
            }
            
            if !isCurrentUser && isPhoto {
                HStack(alignment: .top) {
                    Image("photo").resizable().scaledToFill().frame(width: 30, height: 30).clipShape(Circle())
                    Image("photo1").resizable().scaledToFill().frame(width: 200, height: 200).cornerRadius(10)
                    Spacer()
                }.padding(.leading, 15)
                
            } else if isCurrentUser && isPhoto {
                HStack {
                    Spacer()
                    Image("photo1").resizable().scaledToFill().frame(width: 200, height: 200).cornerRadius(10)
                }.padding(.trailing, 15)
            }
        }
    }
}
