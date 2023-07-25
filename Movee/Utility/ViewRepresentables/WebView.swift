//
//  WebView.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferences
        return WKWebView(frame: .zero, configuration: config)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
