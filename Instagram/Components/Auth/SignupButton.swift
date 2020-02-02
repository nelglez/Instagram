//
//  SignupButton.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/16/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct SignupButton: View {
   var action: () -> Void
       var label: String
       
       var body: some View {
           Button(action: action) {
               HStack {
                   Spacer()
                   Text(label).fontWeight(.bold).foregroundColor(.white)
                   Spacer()
               }
           }.modifier(SigninButtonModifier())
       }
}

struct SignupButton_Previews: PreviewProvider {
    static var previews: some View {
        SignupButton(action: {
            
        }, label: "Test")
    }
}
