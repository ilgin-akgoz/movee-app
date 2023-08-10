//
//  MoviesView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    @StateObject private var viewModel = MoviesViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            VibrantBlueView()
                                .offset(y: -220)
                            Spacer()
                        }
                        VStack {
                            nowPlayingMovies(proxy: proxy)
                            Divider()
                                .frame(width: proxy.size.width * 0.8)
                            popularMoviesView
                                .frame(width: proxy.size.width * 0.8)
                        }
                        .offset(y: -129)
                    }
                    .navigationTitle("movies.navigationTitle")
                    .padding(.top, 68)
                    .background(Color.whiteTwo)
                }
                .overlay {
                    if viewModel.isLoading {
                        ZStack {
                            Color.whiteTwo
                            ProgressView()
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchMovies()
            }
        }
    }
    private func nowPlayingMovies(proxy: GeometryProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.nowPlayingMovies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailView(
                        viewModel: MovieDetailViewModel(movieID: movie.id))
                    ) {
                        MovieCardView(movie: movie, proxy: proxy)
                    }
                }
            }
        }
    }
    private var popularMoviesView: some View {
        VStack(alignment: .leading) {
            Text("movies.popular.title")
                .font(.textStyle7)
            ForEach(viewModel.popularMovies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movieID: movie.id))) {
                    PopularMovieCardView(movie: movie)
                }
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
