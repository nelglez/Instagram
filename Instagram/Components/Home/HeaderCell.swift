//
//  HeaderCell.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct HeaderCell: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("photo1").resizable().clipShape(Circle()).frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text("David").font(.subheadline).bold()
                    Text("Location").font(.caption)
                }
                Spacer()
                Image(systemName: "ellipsis").padding(.trailing, 16)
            }.padding(.leading, 15).padding(.trailing, 15)
            Image("photo2").resizable().scaledToFit().frame(width: UIScreen.main.bounds.size.width, height: 300).clipped().padding(.leading, -16)
        }
    }
}

struct HeaderCell_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCell()
    }
}
