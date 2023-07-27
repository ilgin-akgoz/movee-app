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
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
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
                .frame(width: 400, height: 250)
                .foregroundColor(Color.vibrantBlue)
                .ignoresSafeArea()
                .offset(y: -220)
            Spacer()
        }
    }
    private var nowPlayingMoviesView: some View {
        HStack {
            ForEach(viewModel.nowPlayingMovies, id: \.movieID) { movie in
                MovieCardView(movie: movie, genres: viewModel.movieGenres)
            }
        }
    }
    private var popularMoviesView: some View {
        VStack(alignment: .leading) {
            Text("movies.popular.Title")
                .font(.textStyle7)
                .padding(.leading, 24)
            ForEach(viewModel.popularMovies, id: \.movieID) { movie in
                PopularMovieCardView(movie: movie, genres: viewModel.movieGenres)
                    .padding(.horizontal, 24)
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
