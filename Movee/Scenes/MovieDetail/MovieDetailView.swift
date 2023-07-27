//
//  MovieDetailView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("dummy_image")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .ignoresSafeArea()
            RatingView(rating: "0.0")
                .offset(y: -65)
                .padding(.leading, 24)
            Text("Joker")
                .font(.textStyle11)
                .padding(.top, -60)
                .padding(.leading, 24)
            Text("Crime, Drama, Thriller")
                .font(.textStyle2)
                .padding(.top, -40)
                .padding(.leading, 24)
            HStack {
                Image("time")
                Text("122 min")
                Divider()
                    .frame(width: 12, height: 1)
                    .foregroundColor(.almostBlack)
                Image("calendar")
                Text("dd.mm.yyyy")
            }
            .padding(.top, -24)
            .padding(.leading, 24)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(.almostBlack)
            Divider()
                .frame(width: 327, height: 1)
                .foregroundColor(.almostBlack)
                .padding(.horizontal, 24)
                .padding(.bottom, 10)
            Text("Overview")
                .padding(.horizontal, 24)
            Spacer()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
