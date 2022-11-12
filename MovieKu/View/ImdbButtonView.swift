//
//  ImdbButtonView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 11/11/22.
//

import SwiftUI

struct ImdbButtonView: View {
    
    var movie: Movie
    
    var body: some View {
        GroupBox {
              HStack {
                Image(systemName: "globe")
                Text("Website")
                Spacer()
                let _ = print(movie.imdbId)
                Link("View movie on IMDB", destination: URL(string: "https://www.imdb.com/title/\(movie.imdbId!)")!)
                Image(systemName: "arrow.up.right")
              }
                      .font(.footnote)
            }
    }
}
