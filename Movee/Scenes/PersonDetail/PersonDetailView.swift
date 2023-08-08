//
//  PersonDetailView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct PersonDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: PersonDetailViewModel
    @State private var isShowingFullBio = false
    init(viewModel: PersonDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                personImage
                Text(viewModel.personDetails?.name ?? "")
                    .font(.textStyle11)
                    .padding(.leading, 24)
                if !(viewModel.personDetails?.biography.isEmpty ?? true) {
                    Text(viewModel.personDetails?.biography ?? "")
                        .lineSpacing(7)
                        .lineLimit(isShowingFullBio ? nil : 4)
                        .padding(.horizontal, 24)
                    toggleBioLengthButton
                }
                HStack {
                    Text("person.detail.born")
                        .font(.system(size: 17, weight: .bold))
                    Text(viewModel.personDetails?.bornText ?? "")
                }
                .padding(.horizontal, 24)
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
                await viewModel.fetchDetails()
            }
        }
    }
    private var personImage: some View {
        AsyncImage(url: ImageManager.instance.buildURL(viewModel.personDetails?.profilePath ?? "")) { image in
            image
                .resizable()
                .frame(height: 400)
        } placeholder: {
            Image("dummy_image")
                .resizable()
                .frame(height: 400)
        }
    }
    private var toggleBioLengthButton: some View {
        Button {
            isShowingFullBio.toggle()
        } label: {
            HStack {
                Text(isShowingFullBio ? "person.detail.seeLess" : "person.detail.seeFullBio")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.vibrantBlue)
                    .padding(.leading, 24)
                Image("arrow")
            }
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(viewModel: PersonDetailViewModel(personID: 287))
    }
}
