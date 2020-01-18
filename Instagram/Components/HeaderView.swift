//
//  HeaderView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Group {
            Image(IMAGE_LOGO).resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80)
            Text(TEXT_SIGNIN_HEADLINE).font(.title).padding(.bottom)
            Text(TEXT_SIGNIN_SUBHEADLINE).font(.subheadline).foregroundColor(Color.gray).multilineTextAlignment(.center)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
