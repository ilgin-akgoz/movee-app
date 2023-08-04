//
//  MediaCompactCardView.swift
//  Movee
//
//  Created by Hakan Tekir on 3.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaCompactCardView: View {
    let media: any MediaDataProtocol
    var body: some View {
        VStack {
            mediaPosterImage
            mediaInfo
        }
        .frame(width: 153)
        .background(Color.almostBlack.opacity(0.1))
        .cornerRadius(8)
    }
}

extension MediaCompactCardView {
    private var mediaPosterImage: some View {
        AsyncImage(url: media.posterURL) { image in
            image
                .resizable()
        } placeholder: {
            Image("dummy_image")
                .resizable()
        }
        .frame(width: 153, height: 219)
    }

    private var mediaInfo: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Text(media.title)
                    .lineLimit(2)
                    .font(.textStyle8)
                Spacer()
            }
            Spacer()
            RatingView(rating: media.ratingText)
            Spacer()
        }
        .padding(.leading, 10)
        .frame(width: 153, height: 110)
        .fixedSize(horizontal: true, vertical: true)
    }
}

struct MediaCompactCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCompactCardView(media: MovieDataModel(
            id: 346698,
            title: "Barbie",
            genres: ["Adventure", "Comedy", "Fantasy"],
            posterPath: "",
            voteAverage: 0.0,
            releaseDate: Date()))
    }
}
