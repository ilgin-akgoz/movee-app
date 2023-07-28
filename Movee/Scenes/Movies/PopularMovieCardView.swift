//
//  PopularMovieCardView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct PopularMovieCardView: View {
    let movie: MovieResponseModel
    let genres: [MovieGenreItemResponseModel]
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 327, height: 100)
                .foregroundColor(.white)
                .cornerRadius(8)
            HStack {
                moviePosterImage
                movieInfo
            }
        }
    }
    private var moviePosterImage: some View {
        AsyncImage(url: movie.posterURL) { image in
            image
                .resizable()
                .frame(width: 70, height: 100)
                .roundedCorner(8, corners: [.topLeft, .bottomLeft])
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(width: 70, height: 100)
                .roundedCorner(8, corners: [.topLeft, .bottomLeft])
        }
    }
    private var movieInfo: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.textStyle8)
                .padding(.top, 10)
                .padding(.bottom, 5)
            Text(movieGenresText)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.almostBlack)
            releaseDateAndRatingView
        }
    }
    private var releaseDateAndRatingView: some View {
        HStack {
            Image("calendar")
            Text(movie.formattedReleaseDate)
                .font(.textStyle9)
            Divider()
                .frame(width: 12, height: 1)
                .foregroundColor(.almostBlack)
            RatingView(rating: movie.ratingText)
        }
        .padding(.bottom, 18)
    }
    private var movieGenresText: String {
        return MoviesViewModel().getGenreNames(movie: movie, genres: genres).joined(separator: ", ")
    }
}

struct PopularMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieCardView(movie: MovieResponseModel(movieID: 346698,
                                                    title: "Barbie",
                                                    overview: "",
                                                    genreIDs: [35, 12, 14],
                                                    posterPath:
                                                        "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
                                                    backdropPath: "",
                                                    popularity: 6058.224,
                                                    voteAverage: 7.6,
                                                    isAdult: false,
                                                    releaseDate: Date()),
                                                    genres: [MovieGenreItemResponseModel(
                                                        genreID: 12,
                                                        name: "Adventure")
                                                    ])
    }
}
