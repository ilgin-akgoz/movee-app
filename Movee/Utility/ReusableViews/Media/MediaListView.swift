//
//  MediaListView.swift
//  Movee
//
//  Created by Hakan Tekir on 3.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaListView: View {
    let media: any MediaDataProtocol
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 327, height: 100)
                .foregroundColor(.white)
                .cornerRadius(8)
            HStack {
                mediaPosterImage
                mediaInfo
            }
        }
    }
}

extension MediaListView {
    private var mediaPosterImage: some View {
        AsyncImage(url: media.posterURL) { image in
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

    private var mediaInfo: some View {
        VStack(alignment: .leading) {
            Text(media.title)
                .font(.textStyle8)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .padding(.trailing, 30)
                .lineLimit(1)
            Text(media.genresText)
                .font(.system(size: 15, weight: .regular))
            releaseDateAndRatingView
        }
        .foregroundColor(.almostBlack)
    }

    private var releaseDateAndRatingView: some View {
        HStack {
            Image("calendar")
            Text(media.formattedReleaseDate)
                .font(.textStyle9)
            Divider()
                .frame(width: 12, height: 1)
            RatingView(rating: media.ratingText)
        }
        .padding(.bottom, 18)
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(media: MovieDataModel(
            id: 346698,
            title: "Barbie",
            genres: ["Adventure", "Comedy", "Fantasy"],
            posterPath: "",
            voteAverage: 0.0,
            releaseDate: Date()))
    }
}
