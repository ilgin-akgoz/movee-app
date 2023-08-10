//
//  SearchView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var isFetching = false
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        ZStack {
                            VibrantBlueView()
                                .offset(y: -145)
                            SearchBar(searchQuery: $viewModel.searchQuery, proxy: proxy)
                        }
                        if !viewModel.searchResults.isEmpty {
                            searchResultsView(proxy: proxy)
                        } else if !viewModel.searchQuery.isEmpty {
                            noSearchResultView(proxy: proxy)
                        }
                    }
                }
                .navigationTitle("search.navigationTitle")
                .background(Color.whiteTwo)
            }
        }
        .onChange(of: viewModel.searchQuery) { newQuery in
            if newQuery.count >= 3 {
                Task {
                    await viewModel.fetchResults()
                }
            } else {
                viewModel.searchResults = []
            }
        }
    }
    private func searchResultsView(proxy: GeometryProxy) -> some View {
        VStack(spacing: 20) {
            ForEach(viewModel.searchResults, id: \.id) { result in
                if !viewModel.searchQuery.isEmpty {
                    NavigationLink {
                        destinationView(for: result)
                    } label: {
                        SearchMediaCard(media: result)
                            .frame(width: proxy.size.width * 0.8)
                    }
                }
            }
        }
        .offset(y: -180)
    }
    @ViewBuilder
    private func destinationView(for card: SearchDataModel) -> some View {
        switch card.mediaType {
        case .movie:
            MovieDetailView(viewModel: MovieDetailViewModel(movieID: card.id))
        case .tvSeries:
            TvSeriesDetailView(viewModel: TvSeriesDetailViewModel(seriesID: card.id))
        case .person:
            PersonDetailView(viewModel: PersonDetailViewModel(personID: card.id))
        }
    }
    private func noSearchResultView(proxy: GeometryProxy) -> some View {
        VStack {
            Image("noSearchResult")
            Text("search.noSearchResult")
                .foregroundColor(.vibrantBlue)
                .font(.system(size: 18, weight: .bold))
                .frame(width: proxy.size.width * 0.5)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
