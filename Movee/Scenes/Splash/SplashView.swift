//
//  SplashView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 17.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    var body: some View {
        ZStack {
            if self.isActive {
                LoginView()
            } else {
                Image("splash_background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("splash_icon")
                    Spacer()
                    Text("We 🤍 movie")
                        .font(.textStyle2)
                        .foregroundColor(Color("white"))
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
