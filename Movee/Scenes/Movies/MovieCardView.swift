//
//  MovieCardView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieCardView: View {
    let movie: MovieResponseModel
    let genres: [MovieGenreItemResponseModel]
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .frame(width: 260, height: 373, alignment: .center)
                    .padding(.top, 85)
                    .padding(.horizontal, 58)
            } placeholder: {
                Image("dummy_image")
                    .resizable()
                    .frame(width: 260, height: 373)
                    .padding(.top, 85)
                    .padding(.horizontal, 58)
            }
            RatingView(rating: movie.ratingText)
                .padding(.leading, 24)
                .padding(.top, 10)
            Text(movie.title)
                .font(.textStyle11)
                .lineLimit(1)
                .padding(.leading, 24)
                .foregroundColor(.almostBlack)
            Text(movieGenresText)
                .font(.textStyle2)
                .padding(.bottom, 20)
                .padding(.leading, 24)
                .foregroundColor(.almostBlack)
            Divider()
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
        }
    }
    private var movieGenresText: String {
        let genres = MoviesViewModel().getGenreNames(movie: movie, genres: genres)
        return genres.joined(separator: ", ")
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: MovieResponseModel(movieID: 346698,
                                                title: "Barbie",
                                                overview: "",
                                                genreIDs: [35, 12, 14],
                                                posterPath: "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
                                                backdropPath: "",
                                                popularity: 6058.224,
                                                voteAverage: 7.6,
                                                isAdult: false, releaseDate: ""),
                                                genres: [MovieGenreItemResponseModel(
                                                    genreID: 12,
                                                    name: "Action")])
    }
}
