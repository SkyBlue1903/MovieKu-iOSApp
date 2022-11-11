//
//  MovieDetailView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 10/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {

  @State private var descIsExpanded = false

  var movie: Movie
  var body: some View {
    NavigationView {
      ScrollView(.vertical) {
        VStack(alignment: .leading, spacing: 15) {
            HeaderDetailView(videoID: movie.trailers![0])
                    .frame(width: UIScreen.main.bounds.width, height: 250)
            HStack(alignment: .top) {
              // image and title
              WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath!)" ?? "https://raw.githubusercontent.com/koehlersimon/fallback/master/Resources/Public/Images/placeholder.jpg"))
                      .resizable()
                      .scaledToFill()
                      .frame(width: 100, height: 150)
                      .cornerRadius(15)
              VStack(alignment: .leading, spacing: 5) {
                Text("\(movie.name ?? "Unknown")").font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                VStack(alignment: .trailing, spacing: 5) {
                  Text(movie.description ?? "No description")
                          .multilineTextAlignment(.leading)
                          .lineLimit(4)
                  Button("Read more") {
                    descIsExpanded.toggle()
                  }
                          .sheet(isPresented: $descIsExpanded) {
                            MovieDescriptionView(movie: movie)
                          }
                }
              }
            }
//          Text("Description")
//                  .fontWeight(.bold)
//                  .font(.system(.title2))



        }
      }
              .navigationBarTitle(movie.name ?? "", displayMode: .inline)
              .navigationBarHidden(true)
              .edgesIgnoringSafeArea(.top)
              .navigationViewStyle(StackNavigationViewStyle())
    }

  }
}

//struct MovieDetailView_Previews: PreviewProvider {

//  static var previews: some View {
//    MovieDetailView()
//  }
//}
