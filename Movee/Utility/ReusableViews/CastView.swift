//
//  CastView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct CastView: View {
    let cast: ActorResponseModel
    var body: some View {
        VStack {
            AsyncImage(url: cast.profileURL) { image in
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
            } placeholder: {
                Image("dummy_image")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
            }
            Text(cast.name ?? "")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.almostBlack)
        }
    }
}
