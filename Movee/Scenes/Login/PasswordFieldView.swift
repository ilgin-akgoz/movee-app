//
//  PasswordFieldView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 20.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct PasswordFieldView: View {
    @Binding var isShowingPassword: Bool
    @Binding var password: String
    var body: some View {
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
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(isShowingPassword: .constant(false), password: .constant(""))
    }
}
