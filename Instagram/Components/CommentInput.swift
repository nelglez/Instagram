//
//  CommentInput.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct CommentInput: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("photo1").resizable().clipShape(Circle()).frame(width: 50, height: 50).padding(.leading, 15)
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1).padding()
                HStack {
                    TextField("Add a comment", text: .constant("")).padding(30)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "paperplane").imageScale(.large).foregroundColor(.black).padding(30)
                    }
                }
            }.frame(height: 70)
        }
    }
}

struct CommentInput_Previews: PreviewProvider {
    static var previews: some View {
        CommentInput()
    }
}
