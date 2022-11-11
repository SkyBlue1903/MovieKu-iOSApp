//
//  ContentView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 10/11/22.
//
//

import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {

  @ObservedObject var fetchData = FetchData()
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    if fetchData.moviesData.isEmpty {
      NavigationView {
        ProgressView()
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .scaleEffect(2.5)
        Text("Loading")
                .font(.body)
                .textCase(.uppercase)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .navigationTitle("MovieKu")
      }

    } else {
      NavigationView {
        List(fetchData.moviesData) { movie in
          HStack {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath!)" ?? "https://raw.githubusercontent.com/koehlersimon/fallback/master/Resources/Public/Images/placeholder.jpg"))
                    .placeholder {
//                    Rectangle()
                      VStack(spacing: 10) {
                        ProgressView()
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                        Text("Loading")
                                .font(.caption)
                                .textCase(.uppercase)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                      }
                    }
                    .resizable()
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 100, height: 150)
                    .cornerRadius(15)
            VStack(alignment: .leading, spacing: 5) {
              Text("\(movie.id)")
              // trailer
              Text(movie.trailers![0])
              Text(movie.name ?? "Unknown")
                      .font(.headline)
              Text(movie.releaseDate?.prefix(4) ?? "-")
                      .font(.subheadline)
              HStack {
                RatingView(rating: movie.voteAverage ?? 0.0)
                let newValue = movie.voteAverage ?? 0.0
                Text("(\(String(format: "%.1f", newValue/2 ?? 0.0)))")
                        .font(.subheadline)
              }
            }
          }
        }
                .navigationTitle("MovieKu")
      }


    }

  }
}


struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    ContentView()
  }
}
