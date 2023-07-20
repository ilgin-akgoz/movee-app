//
//  LoginView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 17.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
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
                emailAndPasswordView
                loginButton
                registerView
            }
        }
    }
    private var emailAndPasswordView: some View {
        VStack(alignment: .leading) {
            Text("login.emailField.title")
            TextField("", text: $viewModel.email)
                .font(.system(size: 17, weight: .medium))
                .autocapitalization(.none)
            Divider()
                .background(Color.lightGreyBlue)
                .padding(.trailing, 24)
            Text("login.passwordField.title")
                .padding(.top, 24)
            PasswordFieldView(isShowingPassword: $isShowingPassword, password: $viewModel.password)
            Divider()
                .background(Color.lightGreyBlue)
                .padding(.trailing, 24)
            forgotPasswordButton
        }
        .padding(.leading, 24)
        .foregroundColor(.white)
        .font(.textStyle12)
    }
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button {
            } label: {
                Text("login.forgotPasswordButton.title")
                    .padding(.trailing, 24)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 48)
    }
    private var loginButton: some View {
        Button {
        } label: {
            Text("login.loginButton.title")
                .frame(width: 327, height: 45)
                .background(.white)
                .font(.textStyle6)
                .foregroundColor(Color.vibrantBlue)
                .cornerRadius(4)
        }
    }
    private var registerView: some View {
        HStack {
            Text("login.noAccount.title")
                .foregroundColor(Color.lightGreyBlue)
            Button {
            } label: {
                Text("login.registerButton.title")
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 25)
        .font(.system(size: 12, weight: .medium))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
