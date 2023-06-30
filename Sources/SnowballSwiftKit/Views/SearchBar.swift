//
//  SearchBar.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String?

    public init(text: Binding<String>, placeholder: String? = nil) {
        self._text = text
        self.placeholder = placeholder
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    public func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    public class Coordinator: NSObject, UISearchBarDelegate {
        let control: SearchBar

        public init(_ control: SearchBar) {
            self.control = control
        }

        public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
        }

        public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SearchBar(text: .constant("hello"), placeholder: "")

            SearchBar(text: .constant(""), placeholder: "search item")

            SearchBar(text: .constant(""))
        }
    }
}
