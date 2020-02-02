//
//  HomeView.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 1/27/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewStory()
                ForEach(1..<20) { _ in
                    HeaderCell()
                    FooterCell()
                }
            }.navigationBarTitle("Instagram", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
