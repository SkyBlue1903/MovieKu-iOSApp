//
//  HeaderDetailView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 11/11/22.
//

import SwiftUI
import WebKit

struct HeaderDetailView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)?loop=1") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
