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
    @State private var shouldPresentForgotPasswordView = false
    @State private var shouldPresentRegisterView = false
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
        .overlay {
            if viewModel.showLoginFailedView {
                ZStack {
                    Color.black.opacity(0.5)
                    LoginFailedView(isPresented: $viewModel.showLoginFailedView)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                }
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
                shouldPresentForgotPasswordView = true
            } label: {
                Text("login.forgotPasswordButton.title")
                    .padding(.trailing, 24)
            }
            .sheet(isPresented: $shouldPresentForgotPasswordView) {
                WebView(url: URL(string: "https://www.themoviedb.org/reset-password"))
                    .ignoresSafeArea()
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 48)
    }
    private var loginButton: some View {
        Button {
            Task {
                await viewModel.login()
            }
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
                shouldPresentRegisterView = true
            } label: {
                Text("login.registerButton.title")
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $shouldPresentRegisterView) {
                WebView(url: URL(string: "https://www.themoviedb.org/signup"))
                    .ignoresSafeArea()
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
