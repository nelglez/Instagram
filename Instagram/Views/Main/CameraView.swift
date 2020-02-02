//
//  CameraView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("photo").resizable().scaledToFill().frame(width: 60, height: 60).clipped()
                    TextField("Write a caption...", text: .constant("")).padding(.top, 5)
                }.padding()
                Spacer()
            }.navigationBarTitle("Camera", displayMode: .inline).navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "arrow.turn.up.right").imageScale(.large)
            })).foregroundColor(.black)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
