//
//  NotificationView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image("photo1").resizable().clipShape(Circle()).frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("David").font(.headline).bold()
                            Text("Share a new photo").font(.subheadline)
                        }
                        Spacer()
                        Text("1:00").bold()
                    }.padding(10)
                }
                
            }.navigationBarTitle("Activity", displayMode: .inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
