//
//  MainView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: MainTabs = .movies
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView()
                .tabItem {
                    if selectedTab == .movies {
                        Image("iconTabbarMovieSelected")
                    } else {
                        Image("iconTabbarMovie")
                    }
                }.tag(MainTabs.movies)
            TvSeriesView()
                .tabItem {
                    if selectedTab == .tvSeries {
                        Image("iconTabbarTvSeriesSelected")
                    } else {
                        Image("iconTabbarTvSeries")
                    }
                }.tag(MainTabs.tvSeries)
        }
    }
}

enum MainTabs {
    case movies
    case tvSeries
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
