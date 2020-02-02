//
//  EmailTextField.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
            TextField(TEXT_EMAIL, text: $email)
        }.modifier(TextFieldModifier())
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(email: .constant("test@gmail.com"))
    }
}
