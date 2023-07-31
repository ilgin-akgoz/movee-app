//
//  MovieDetailView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: MovieDetailViewModel
    let movieID: Int
    init(movieID: Int) {
        self.movieID = movieID
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movieID: movieID))
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                moviePosterImage
                RatingView(rating: viewModel.movieDetails?.ratingText ?? "0.0")
                    .offset(y: -36)
                    .padding(.leading, 24)
                titleAndGenres
                durationAndReleaseDate
                Divider()
                    .frame(width: 327, height: 1)
                    .foregroundColor(.almostBlack)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 10)
                Text(viewModel.movieDetails?.overview ?? "Overview")
                    .padding(.horizontal, 24)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("iconArrowBack")
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchMovie()
            }
        }
    }
    private var moviePosterImage: some View {
        AsyncImage(url: viewModel.movieDetails?.posterURL) { image in
            image
                .resizable()
                .frame(width: 400, height: 400)
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(width: 400, height: 400)
        }
    }
    private var titleAndGenres: some View {
        VStack(alignment: .leading) {
            Text(viewModel.movieDetails?.title ?? "N/A")
                .font(.textStyle11)
                .padding(.top, -50)
                .padding(.horizontal, 24)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(viewModel.movieDetails?.genresText ?? "N/A")
                .font(.textStyle2)
                .padding(.top, -32)
                .padding(.leading, 24)
        }
    }
    private var durationAndReleaseDate: some View {
        HStack {
            Image("time")
            Text(viewModel.movieDetails?.durationText ?? "0 min")
            Divider()
                .frame(width: 12, height: 1)
                .foregroundColor(.almostBlack)
            Image("calendar")
            Text(viewModel.movieDetails?.formattedReleaseDate ?? "N/A")
        }
        .padding(.top, -24)
        .padding(.leading, 24)
        .font(.system(size: 15, weight: .regular))
        .foregroundColor(.almostBlack)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieID: 346698)
    }
}
