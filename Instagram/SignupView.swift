//
//  SignupView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/16/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI


struct SignupView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showImagePicker = false
    @State private var image: Image = Image(IMAGE_USER_PLACEHOLDER)
    @State private var imageData: Data = Data()
    var signUpViewModel = SignupViewModel()
    
    
    var body: some View {
        VStack {
            image.resizable().aspectRatio(contentMode: .fill).frame(width: 80, height: 80).clipShape(Circle()).padding(.bottom, 30).onTapGesture {
                
                self.showImagePicker = true
            }
            UsernameTextField(username: $username)
            EmailTextField(email: $email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $password)
                Text(TEXT_SIGNUP_PASSWORD_REQUIRED).font(.footnote).foregroundColor(.gray).padding(.leading)
            }
            SignupButton(action: {
                self.signUp()
            }, label: TEXT_SIGN_UP)
            
            Divider()
            
            Text(TEXT_SIGNUP_NOTE).font(.footnote).foregroundColor(.gray).padding().lineLimit(nil)
            
          //  Spacer()
        }.sheet(isPresented: $showImagePicker, content: {
            ImagePicker(showImagePicker: self.$showImagePicker ,pickedImage: self.$image, imageData: self.$imageData)
        }).navigationBarTitle("Register", displayMode: .inline)
    }
    
    func signUp() {
       
        signUpViewModel.signup(username: username, email: email, password: password, imageData: imageData) { (user) in
            print(user.email)
            //Switch to the main app here.
            }
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
