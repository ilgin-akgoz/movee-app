//
//  MainView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Image("iconTabbarMovie")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
