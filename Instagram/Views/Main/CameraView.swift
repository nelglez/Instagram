//
//  CameraView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject var cameraViewModel = CameraViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    cameraViewModel.image.resizable().scaledToFill().frame(width: 60, height: 60).clipped().onTapGesture {
                        
                        self.cameraViewModel.showImagePicker = true
                    }
                    TextField("Write a caption...", text: $cameraViewModel.caption).padding(.top, 5)
                }.padding()
                Spacer()
            }.sheet(isPresented: $cameraViewModel.showImagePicker, content: {
                ImagePicker(showImagePicker: self.$cameraViewModel.showImagePicker ,pickedImage: self.$cameraViewModel.image, imageData: self.$cameraViewModel.imageData)
            }).navigationBarTitle("Camera", displayMode: .inline).navigationBarItems(trailing: Button(action: sharePost) {
    
                Image(systemName: "arrow.turn.up.right").imageScale(.large)
            }.alert(isPresented: $cameraViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(cameraViewModel.errorString), dismissButton: .default(Text("OK")))
            }).foregroundColor(.black)
        }
    }
    
    private func sharePost() {
        cameraViewModel.sharePost(completed: {
            print("Done")
        }) { (errorMessage) in
            print("error: " , errorMessage)
            self.cameraViewModel.showAlert = true
            self.cameraViewModel.errorString = errorMessage
            self.clear()
        }
    }
    
    private func clear() {
        self.cameraViewModel.caption = ""
        self.cameraViewModel.image = Image(systemName: IMAGE_PHOTO)
        self.cameraViewModel.imageData = Data()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
