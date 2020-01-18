//
//  PasswordTextField.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
            SecureField(TEXT_PASSWORD, text: $password)
        }.modifier(TextFieldModifier())
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(password: .constant("123456"))
    }
}
