//
//  PopularMovieCardView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct PopularMovieCardView: View {
    let movie: MovieDataModel
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.white)
                .cornerRadius(8)
            HStack {
                moviePosterImage
                movieInfo
            }
        }
    }
    private var moviePosterImage: some View {
        AsyncImage(url: ImageManager.instance.buildURL(movie.posterPath ?? "")) { image in
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
                .padding(.trailing, 30)
                .lineLimit(1)
            Text(movie.genresText)
                .font(.system(size: 15, weight: .regular))
            releaseDateAndRatingView
        }
        .foregroundColor(.almostBlack)
    }
    private var releaseDateAndRatingView: some View {
        HStack {
            Image("calendar")
            Text(movie.formattedReleaseDate)
                .font(.textStyle9)
            Divider()
                .frame(width: 12, height: 1)
            RatingView(rating: movie.ratingText)
        }
        .padding(.bottom, 18)
    }
}

struct PopularMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieCardView(movie: MovieDataModel(
            id: 346698,
            title: "Barbie",
            genres: ["Adventure", "Comedy", "Fantasy"],
            posterPath: "",
            voteAverage: 0.0,
            releaseDate: Date()))
    }
}
