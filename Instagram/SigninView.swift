//
//  ContentView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct SigninView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
              //  Spacer()
                HeaderView()
                
           //     Spacer()
                Divider()
                
                EmailTextField(email: $email)
                PasswordTextField(password: $password)
                
                SigninButton(action: {
                    
                }, label: "Sign in")
                
                Divider()
                
                NavigationLink(destination: SignupView()) {
                    SignupTextView()
                }
                Spacer()
            }
        }.accentColor(.black)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}










