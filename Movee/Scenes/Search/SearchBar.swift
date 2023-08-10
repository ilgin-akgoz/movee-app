//
//  SearchBar.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String
    @FocusState private var isFocused: Bool
    @State private var isShowingIcon = false
    let proxy: GeometryProxy
    var body: some View {
        HStack {
            HStack {
                Image("miniSearchIcon")
                TextField("search.bar.placeholder", text: $searchQuery)
                    .foregroundColor(.almostBlack)
                    .font(.system(size: 17, weight: .medium))
                    .focused($isFocused)
                    .onChange(of: searchQuery) { _ in
                        isShowingIcon = true
                    }
                if isShowingIcon {
                    Button {
                        searchQuery = ""
                    } label: {
                        Image("miniXIcon")
                            .padding(.trailing, 9)
                    }
                }
            }
            .padding(.leading, 9)
            .frame(height: 36)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
            Button {
                searchQuery = ""
                isFocused = false
            } label: {
                Text("search.bar.cancel")
                    .foregroundColor(.white)
            }
        }
        .frame(width: proxy.size.width * 0.8)
        .offset(y: -90)
    }
}
