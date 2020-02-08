//
//  SearchBar.swift
//  Instagram
//
//  Created by Nelson Gonzalez on 2/8/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    var onSearchButtonChanged: (() -> Void)? = nil
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = self.text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        let searchBarView: SearchBar
        
        init(_ searchBar: SearchBar) {
            self.searchBarView = searchBar
        }
        //Called when the user enters in text
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarView.text = searchText
            searchBarView.onSearchButtonChanged?()
        }
        //Called when user clicks on the search button
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBarView.onSearchButtonChanged?()
            searchBar.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
