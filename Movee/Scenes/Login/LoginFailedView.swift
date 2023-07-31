//
//  LoginFailedView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LoginFailedView: View {
    @Binding var isPresented: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 275, height: 259)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 50)
            VStack {
                Rectangle()
                    .frame(width: 275, height: 80)
                    .roundedCorner(10, corners: [.topLeft, .topRight])
                    .foregroundColor(Color.vibrantBlue)
                    .overlay {
                        Image("login_popup")
                            .background(Color.vibrantBlue)
                    }
                    .offset(x: 0, y: -26)
                Text("login.loginFailed.title")
                    .font(.textStyle2)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 24)
                    .foregroundColor(.almostBlack)
                Button {
                    isPresented = false
                } label: {
                    Text("login.okayButton.title")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 45)
                        .font(.textStyle6)
                        .background(Color.vibrantBlue)
                        .cornerRadius(4)
                }
                .padding(.bottom, 32)
            }
        }
    }
}

struct LoginFailedView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFailedView(isPresented: .constant(false))
    }
}
