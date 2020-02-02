//
//  CommentView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(1..<10) { _ in
                    CommentRow().padding(.bottom, 10)
                }
            }
            CommentInput()
        }.padding(.top, 15)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
