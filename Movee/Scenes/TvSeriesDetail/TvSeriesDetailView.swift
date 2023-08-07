//
//  TvSeriesDetailView.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvSeriesDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: TvSeriesDetailViewModel
    init(viewModel: TvSeriesDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                moviePosterImage
                RatingView(rating: viewModel.seriesDetails?.ratingText ?? "0.0")
                    .offset(y: -36)
                    .padding(.leading, 24)
                titleAndGenres
                durationAndReleaseDate
                Divider()
                    .foregroundColor(.almostBlack)
                    .padding(.horizontal, 24)                    
                Text(viewModel.seriesDetails?.overview ?? "Overview")
                    .padding(.horizontal, 24)
                episodeInfos
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("iconArrowBack")
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchMovie()
            }
        }
    }
    private var moviePosterImage: some View {
        AsyncImage(url: viewModel.seriesDetails?.posterURL) { image in
            image
                .resizable()
                .frame(width: 400, height: 400)
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(width: 400, height: 400)
        }
    }
    private var titleAndGenres: some View {
        VStack(alignment: .leading) {
            Text(viewModel.seriesDetails?.title ?? "N/A")
                .font(.textStyle11)
                .padding(.top, -50)
                .padding(.horizontal, 24)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(viewModel.seriesDetails?.genresText ?? "N/A")
                .font(.textStyle2)
                .padding(.top, -32)
                .padding(.leading, 24)
        }
    }
    private var durationAndReleaseDate: some View {
        HStack {
            Image("time")
            Text(viewModel.seriesDetails?.durationText ?? "0 min")
            Divider()
                .frame(width: 12, height: 1)
                .foregroundColor(.almostBlack)
            Image("calendar")
            Text(viewModel.seriesDetails?.yearRangeText ?? "")
        }
        .padding(.top, -24)
        .padding(.leading, 24)
        .font(.system(size: 15, weight: .regular))
        .foregroundColor(.almostBlack)
    }

    private var episodeInfos: some View {
        HStack {
            HStack {
                Text(viewModel.seriesDetails?.seasonsText ?? "")
                    .font(.textStyle10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
            }
            .background(Color.almostGray)
            .cornerRadius(12)
            .padding(.leading, 24)

            HStack {
                Text(viewModel.seriesDetails?.episodesText ?? "")
                    .font(.textStyle10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
            }
            .background(Color.almostGray)
            .cornerRadius(12)
            .padding(.leading, 12)
        }
    }
}

struct TvSeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailView(viewModel: .init(seriesID: 1396))
    }
}
