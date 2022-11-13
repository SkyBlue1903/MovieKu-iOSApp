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

  @ObservedObject var fetchNowPlaying = FetchData(endpoint: "popular")
  @ObservedObject var fetchUpcoming = FetchData(endpoint: "upcoming")
  @ObservedObject var fetchTopRated = FetchData(endpoint: "top_rated")
  @Environment(\.colorScheme) var colorScheme
  @State private var index = 0

  var body: some View {
    NavigationView {
      ScrollView(.vertical) {
        VStack(alignment: .leading) {

          CarouselTabView()
                  .frame(height: UIScreen.main.bounds.height * 0.4)


          Text("Popular")
                  .font(.title)
                  .fontWeight(.bold)
                  .padding(.horizontal)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
              ForEach(fetchNowPlaying.moviesData[0..<fetchNowPlaying.moviesData.count]) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                  VStack(alignment: .leading) {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.backdropPath!)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 275, height: 150)
                            .cornerRadius(15)
                    Text(movie.name!)
                            .lineLimit(1)
                  }
                          .lineLimit(1)
//                  .frame(width: 150, height: 200)
                }
                        .buttonStyle(PlainButtonStyle())
              }
            }
                    .padding(.horizontal, 15)
          }
                  .padding(.bottom, 20)
          Divider()
          Text("Top Rated")
                  .font(.title)
                  .fontWeight(.bold)
                  .padding(.horizontal)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
              ForEach(fetchTopRated.moviesData[0..<fetchTopRated.moviesData.count]) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                  VStack(alignment: .leading) {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.backdropPath!)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 275, height: 150)
                            .cornerRadius(15)
                    Text(movie.name!)
                            .lineLimit(1)
                  }
                          .lineLimit(1)
//                  .frame(width: 150, height: 200)
                }
                        .buttonStyle(PlainButtonStyle())
              }
            }
                    .padding(.horizontal, 15)
          }
                  .padding(.bottom, 20)
          Divider()
          Text("Upcoming")
                  .font(.title)
                  .fontWeight(.bold)
                  .padding(.horizontal)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
              ForEach(fetchUpcoming.moviesData[0..<fetchUpcoming.moviesData.count]) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                  VStack(alignment: .leading) {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.backdropPath!)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 275, height: 150)
                            .cornerRadius(15)
                    Text(movie.name!)
                            .lineLimit(1)
                  }
                          .lineLimit(1)
//                  .frame(width: 150, height: 200)
                }
                        .buttonStyle(PlainButtonStyle())
              }
            }
                    .padding(.horizontal, 15)
          }

        }
                .navigationBarTitle("MovieKu", displayMode: .inline)
                .navigationBarHidden(true)
//                .navigationBarColor(backgroundColor: .clear, titleColor: .white)


      }
              .edgesIgnoringSafeArea(.top)
    }
            
            .navigationViewStyle(StackNavigationViewStyle())
  }
}


struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    ContentView()
  }
}
