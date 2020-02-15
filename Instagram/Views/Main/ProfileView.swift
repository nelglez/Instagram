//
//  ProfileView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionStore
    var photoArray = [Photo(photo: "photo"), Photo(photo: "photo1"), Photo(photo: "photo2"), Photo(photo: "photo3"), Photo(photo: "photo4"), Photo(photo: "photo5"), Photo(photo: "photo6"), Photo(photo: "photo7"), Photo(photo: "photo8"), Photo(photo: "photo9")]
    @State private var selection = 0
    var displayState = ["square.grid.2x2.fill", "list.dash"]
    
    var body: some View {
        let splittedArray = photoArray.splited(into: 3)
        
        return NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 15) {
                    ProfileHeader(user: session.userSession!)
                    EditProfileButton()
                    
                    ProfileInformation(user: session.userSession!)
                    
                    Picker(selection: $selection, label: Text("Grid or Table")) {
                        ForEach(0..<displayState.count) { index in
                            
                            Image(self.displayState[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                    VStack(alignment: .leading, spacing: 1) {
                        //Rows
                        ForEach(0..<splittedArray.count) { index in
                            HStack(spacing: 1) {
                                //Columns
                                ForEach(splittedArray[index]) { photo_element in
                                    Image(photo_element.photo).resizable().scaledToFill().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3).clipped()//Prevents image to overlap its boundaries.
                                }
                            }
                        }
                    }
                }.padding(.top, 20)
                }.navigationBarTitle("Profile", displayMode: .inline).navigationBarItems(leading:
                    Button(action: {
                    
                }) {
                    NavigationLink(destination: UsersView()) {
                        Image(systemName: "person.fill").imageScale(.large).foregroundColor(.black)
                    }
                }, trailing:
                    Button(action: {
                        self.session.logOut()
                }) {
                    
                        Image(systemName: "arrow.right.circle.fill").imageScale(.large).foregroundColor(.black)
                    
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct EditProfileButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Spacer()
                Text("Edit Profile").fontWeight(.bold).foregroundColor(.white)
                Spacer()
            }.frame(height: 30).background(Color.black)
        }.cornerRadius(5).padding(.leading, 20).padding(.trailing, 20)
    }
}

struct ProfileInformation: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.username).bold()
            Text("iOS Developer")
        }.padding(.leading, 20)
    }
}
