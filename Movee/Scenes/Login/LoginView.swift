//
//  LoginView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 17.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isShowingPassword = false
    var body: some View {
        ZStack {
            Image("login_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image("splash_icon")
                    .padding(.bottom, 91)
                VStack(alignment: .leading) {
                    Text("email")
                    TextField("", text: $email)
                        .font(.system(size: 17, weight: .medium))
                        .autocapitalization(.none)
                    Divider()
                        .background(Color.lightGreyBlue)
                        .padding(.trailing, 24)
                    Text("password")
                        .padding(.top, 24)
                    HStack {
                        if isShowingPassword {
                            TextField("", text: $password)
                                .font(.system(size: 17, weight: .medium))
                                .autocapitalization(.none)
                        } else {
                            SecureField("", text: $password)
                                .font(.system(size: 17, weight: .medium))
                        }
                        Spacer()
                        Button(action: {
                            isShowingPassword.toggle()
                        }, label: {
                            Image(systemName: isShowingPassword ? "eye.fill" : "eye.slash.fill")
                        })
                        .padding(.trailing, 24)
                    }
                    Divider()
                        .background(Color.lightGreyBlue)
                        .padding(.trailing, 24)
                    HStack {
                        Spacer()
                        Button {
                        } label: {
                            Text("forgot_password")
                                .padding(.trailing, 24)
                        }
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 48)
                }
                .padding(.leading, 24)
                .foregroundColor(.white)
                .font(.textStyle12)
                Button {
                } label: {
                    Text("login")
                        .frame(width: 327, height: 45)
                        .background(.white)
                        .font(.textStyle6)
                        .foregroundColor(Color.vibrantBlue)
                        .cornerRadius(4)
                }
                HStack {
                    Text("no_account")
                        .foregroundColor(Color.lightGreyBlue)
                    Button {
                    } label: {
                        Text("register")
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 25)
                .font(.system(size: 12, weight: .medium))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
