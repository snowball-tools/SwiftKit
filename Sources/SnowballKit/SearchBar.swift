//
//  SearchBar.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        let control: SearchBar

        init(_ control: SearchBar) {
            self.control = control
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}
