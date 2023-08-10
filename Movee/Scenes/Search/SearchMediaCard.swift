//
//  SearchMediaCard.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SearchMediaCard: View {
    let media: SearchDataModel
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.white)
                .cornerRadius(8)
            HStack {
                mediaImage
                mediaInfo
            }
        }
    }
    private var mediaImage: some View {
        AsyncImage(url: ImageManager.instance.buildURL(media.imagePath)) { image in
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
                .lineLimit(1)
            HStack {
                Image(media.mediaTypeIcon)
                Text(media.mediaTypeText.localized)
                    .font(.textStyle9)
            }
        }
        .foregroundColor(.almostBlack)
    }
}

struct SearchMediaCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchMediaCard(media: SearchDataModel(
            id: 24511,
            title: "Bradley",
            overview: "",
            imagePath: "/dl4ftVOH532YmV1I9jOLYwexv2F.jpg",
            mediaType: .tvSeries,
            mediaTypeIcon: "tvIcon",
            mediaTypeText: "TV Series"
        ))
    }
}
