//
//  ContentView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/15/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct SigninView: View {
   
    @ObservedObject var signInViewModel = SignInViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
              //  Spacer()
                HeaderView()
                
           //     Spacer()
                Divider()
                
                EmailTextField(email: $signInViewModel.email)
                PasswordTextField(password: $signInViewModel.password)
                
                SigninButton(action: {
                    self.signIn()
                    
                }, label: TEXT_SIGN_IN).alert(isPresented: $signInViewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(signInViewModel.errorString), dismissButton: .default(Text("OK")))
                }
                
                Divider()
                
                NavigationLink(destination: SignupView()) {
                    SignupTextView()
                }
                Spacer()
            }
        }.accentColor(.black)
    }
    
    func signIn() {
        
        signInViewModel.signin(email: signInViewModel.email, password: signInViewModel.password, completed: { (user) in
            print(user.email)
            self.clear()
        }) { (errorMessage) in
             print("error: " , errorMessage)
            self.signInViewModel.showAlert = true
            self.signInViewModel.errorString = errorMessage
            self.clear()
        }
    }
    
    func clear() {
        self.signInViewModel.email = ""
        self.signInViewModel.password = ""
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}










