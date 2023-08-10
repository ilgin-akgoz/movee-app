//
//  TvSeriesView.swift
//  Movee
//
//  Created by Hakan Tekir on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvSeriesView: View {
    @StateObject private var viewModel = TvSeriesViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView(showsIndicators: false) {
                    ZStack {
                        vibrantBlueView
                        VStack {
                            nowPlayingTvSeries(proxy: proxy)
                            Divider()
                                .frame(width: proxy.size.width * 0.8)
                            topRatedTvSeries
                                .frame(width: proxy.size.width * 0.8)
                        }
                        .offset(y: -129)
                    }
                    .padding(.top, 68)
                }
                .navigationTitle("series.navigationTitle")
                .background(Color.whiteTwo)
                .overlay {
                    if viewModel.isLoading {
                        ZStack {
                            Color.whiteTwo
                            ProgressView()
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchSeries()
            }
        }
    }
}

extension TvSeriesView {
    private var vibrantBlueView: some View {
        VStack {
            Rectangle()
                .frame(height: 250)
                .foregroundColor(Color.vibrantBlue)
                .ignoresSafeArea()
                .offset(y: -220)
            Spacer()
        }
    }

    private func nowPlayingTvSeries(proxy: GeometryProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.nowPlayingSeries, id: \.self) { tvSeries in
                    NavigationLink {
                        TvSeriesDetailView(viewModel: .init(seriesID: tvSeries.id))
                    } label: {
                        MediaCardView(media: tvSeries, proxy: proxy)
                    }
                }
            }
        }
    }

    private var topRatedTvSeries: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        return VStack(alignment: .leading) {
            Text("series.top.title")
                .font(.textStyle7)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.popularSeries, id: \.id) { tvSeries in
                    NavigationLink {
                        TvSeriesDetailView(viewModel: .init(seriesID: tvSeries.id))
                    } label: {
                        MediaCompactCardView(media: tvSeries)
                    }
                }
            }
        }
    }
}

struct TvSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesView()
    }
}
