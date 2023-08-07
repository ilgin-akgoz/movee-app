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
            ScrollView(showsIndicators: false) {
                ZStack {
                    vibrantBlueView
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            nowPlayingMoviesView
                        }
                        popularMoviesView
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
        .onAppear {
            Task {
                await viewModel.fetchMovies()
            }
        }
    }
    private var vibrantBlueView: some View {
        VStack {
            Rectangle()
                .frame(height: 250)
                .foregroundColor(Color.vibrantBlue)
                .ignoresSafeArea()
                .offset(y: -220)
            Spacer()
        }
    }
    private var nowPlayingMoviesView: some View {
        HStack {
            ForEach(viewModel.nowPlayingMovies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movieID: movie.id))) {
                    MovieCardView(movie: movie)
                }
            }
        }
    }
    private var popularMoviesView: some View {
        VStack(alignment: .leading) {
            Text("movies.popular.title")
                .font(.textStyle7)
                .padding(.leading, 24)
            ForEach(viewModel.popularMovies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movieID: movie.id))) {
                    PopularMovieCardView(movie: movie)
                        .padding(.horizontal, 24)
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
