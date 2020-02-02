//
//  SignupView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/16/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI


struct SignupView: View {

   @ObservedObject var signUpViewModel = SignupViewModel()
    
    
    var body: some View {
        VStack {
            signUpViewModel.image.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80).clipShape(Circle()).padding(.bottom, 30).onTapGesture {
                
                self.signUpViewModel.showImagePicker = true
            }
            UsernameTextField(username: $signUpViewModel.username)
            EmailTextField(email: $signUpViewModel.email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $signUpViewModel.password)
                Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding(.leading)
            }
            SignupButton(action: {
                self.signUp()
            }, label: TEXT_SIGN_UP).alert(isPresented: $signUpViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(signUpViewModel.errorString), dismissButton: .default(Text("OK")))
            }
            
            Divider()
            
            Text(TEXT_SIGNUP_NOTE).font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
            
          //  Spacer()
        }.sheet(isPresented: $signUpViewModel.showImagePicker, content: {
            ImagePicker(showImagePicker: self.$signUpViewModel.showImagePicker ,pickedImage: self.$signUpViewModel.image, imageData: self.$signUpViewModel.imageData)
        }).navigationBarTitle("Register", displayMode: .inline)
    }
    
    func signUp() {
       
        signUpViewModel.signup(username: signUpViewModel.username, email: signUpViewModel.email, password: signUpViewModel.password, imageData: signUpViewModel.imageData, completed: { (user) in
            print(user.email)
            self.clear()
        }) { (errorMessage) in
            print("error: " , errorMessage)
            self.signUpViewModel.showAlert = true
            self.signUpViewModel.errorString = errorMessage
            self.clear()
        }
    }
    
    func clear() {
        self.signUpViewModel.username = ""
        self.signUpViewModel.email = ""
        self.signUpViewModel.password = ""
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
