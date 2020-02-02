//
//  SearchView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/2/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    var photo = ""
}

struct SearchView: View {
    var photoArray = [Photo(photo: "photo"), Photo(photo: "photo1"), Photo(photo: "photo2"), Photo(photo: "photo3"), Photo(photo: "photo4"), Photo(photo: "photo5"), Photo(photo: "photo6"), Photo(photo: "photo7"), Photo(photo: "photo8"), Photo(photo: "photo9")]
    var body: some View {
        let splittedArray = photoArray.splited(into: 3)
       return ScrollView {
            //Rows
            ForEach(0..<splittedArray.count) { index in
                HStack {
                    //Columns
                    ForEach(splittedArray[index]) { photo_element in
                        Image(photo_element.photo).resizable().scaledToFit()
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
