//
//  MediaCardView.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaCardView: View {
    let media: any MediaDataProtocol
    let proxy: GeometryProxy
    var body: some View {
        VStack {
            mediaPosterImage
            mediaInfo
        }
    }
    private var mediaPosterImage: some View {
        AsyncImage(url: ImageManager.instance.buildURL(media.posterPath ?? "")) { image in
            image
                .resizable()
                .frame(width: proxy.size.width * 0.7, height: 373)
                .cornerRadius(8)
                .padding(.top, 85)
                .padding(.horizontal, 58)
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(width: proxy.size.width * 0.7, height: 373)
                .cornerRadius(8)
                .padding(.top, 85)
                .padding(.horizontal, 58)
        }
    }
    private var mediaInfo: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: proxy.size.width * 0.8)
                    .foregroundColor(.whiteTwo)
                VStack(alignment: .leading) {
                    RatingView(rating: media.ratingText)
                        .padding(.top, 10)
                    Text(media.title)
                        .font(.textStyle11)
                        .lineLimit(1)
                        .foregroundColor(.almostBlack)
                    Text(media.genresText)
                        .font(.textStyle2)
                        .padding(.bottom, 20)
                        .foregroundColor(.almostBlack)
                }
            }
        }
    }
}

struct MediaCardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            MediaCardView(
                media: MovieDataModel(
                    id: 346698,
                    title: "Barbie",
                    genres: ["Adventure", "Comedy", "Fantasy"],
                    posterPath: "",
                    voteAverage: 0.0,
                    releaseDate: Date()
                ),
                proxy: proxy
            )
        }
    }
}
