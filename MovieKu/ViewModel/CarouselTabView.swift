//
//  CarouselTabView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 12/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarouselTabView: View {

    @ObservedObject var fetchNowPlaying = FetchData(endpoint: "now_playing")
    @Environment(\.colorScheme) var colorScheme
//    var movie: Movie?

    @State private var index = 0
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach(fetchNowPlaying.moviesData[0..<fetchNowPlaying.moviesData.count]) { movie in
                  NavigationLink(destination: MovieDetailView(movie: movie)) {
                    ZStack {
                      WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.backdropPath!)"))
                              .resizable()
                              .placeholder {
                                Rectangle()
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                        .overlay(
                                                VStack(spacing: 10) {
                                                  ProgressView()
                                                          .foregroundColor(colorScheme == .dark ? .black : .white)
                                                  Text("Loading")
                                                          .font(.caption)
                                                          .textCase(.uppercase)
                                                          .foregroundColor(colorScheme == .dark ? .white : .black)
                                                }
                                        )
                              }
                              .scaledToFill()
                      Text(movie.name ?? "Unknown")
                              .font(.title2)
                              .multilineTextAlignment(.center)
                              .lineLimit(2)
                              .padding()
                              .fontWeight(.bold)
                              .foregroundColor(.white)
                              .offset(y: 20)
                              .shadow(color: .black, radius: 30, x: 0, y: 10)
                      Text("View Detail")
                              .frame(width: 150, height: 50)
                              .background(.white)
                              .foregroundColor(.black)
                              .clipShape(Capsule())
                              .offset(y: 65)
                    }

                  }
                }
            }
                    .tabViewStyle(PageTabViewStyle())
        }
    }


}

//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView()
//    }
//}
