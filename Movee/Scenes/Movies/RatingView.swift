//
//  RatingView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    let rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 61, height: 24)
                .foregroundColor(Color.vibrantBlue)
                .cornerRadius(12)
            HStack {
                Image("star")
                Text(rating)
                    .font(.textStyle10)
            }
            .foregroundColor(.white)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: "8.6")
    }
}
