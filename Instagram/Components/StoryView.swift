//
//  StoryView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ScrollViewStory: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(1..<10) { _ in
                    VStack {
                        Image("photo1").resizable().clipShape(Circle()).aspectRatio(contentMode: .fill).frame(width: 50, height: 50).overlay(Circle().inset(by: -2.5).stroke(AngularGradient(gradient: Gradient(colors: Color.instagram), center: UnitPoint(x: 0.5, y: 0.5)), lineWidth: 5)).overlay(Circle().inset(by: -2.5).stroke(Color.white, lineWidth: 2)).shadow(radius: 3)
                        Text("Story").font(.caption)
                        
                    }
                }
            }.padding(.top, 10).padding(.leading, 5)
            Image(systemName: "plus.circle.fill").position(x: 50, y: -40)
        }.frame(height: 90)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewStory()
    }
}
