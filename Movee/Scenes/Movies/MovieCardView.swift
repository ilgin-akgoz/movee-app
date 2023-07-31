//
//  MovieCardView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieCardView: View {
    let movie: MovieDataModel
    var body: some View {
        VStack {
            moviePosterImage
            movieInfo
        }
    }
    private var moviePosterImage: some View {
        AsyncImage(url: movie.posterURL) { image in
            image
                .resizable()
                .frame(width: 260, height: 373)
                .padding(.top, 85)
                .padding(.horizontal, 58)
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(width: 260, height: 373)
                .padding(.top, 85)
                .padding(.horizontal, 58)
        }
    }
    private var movieInfo: some View {
        VStack(alignment: .leading) {
            RatingView(rating: movie.ratingText)
                .padding(.top, 10)
            Text(movie.title)
                .font(.textStyle11)
                .lineLimit(1)
                .foregroundColor(.almostBlack)
            Text(movie.genresText)
                .font(.textStyle2)
                .padding(.bottom, 20)
                .foregroundColor(.almostBlack)
            Divider()
                .padding(.trailing, 24)
                .padding(.bottom, 20)
        }
        .padding(.leading, 24)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: MovieDataModel(
            movieID: 346698,
            title: "Barbie",
            genres: ["Adventure", "Comedy", "Fantasy"],
            posterPath: "",
            voteAverage: 0.0,
            releaseDate: Date()))
    }
}
