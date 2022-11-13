//
//  ListView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 12/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {

  @ObservedObject var fetchPopular = FetchData(endpoint: "popular")
  @ObservedObject var fetchUpcoming = FetchData(endpoint: "upcoming")
  @ObservedObject var fetchTopRated = FetchData(endpoint: "top_rated")
  @Environment(\.colorScheme) var colorScheme
  @State var selected = 1


  var body: some View {
    VStack(alignment: .leading) {
      Text("Popular")
              .font(.title)
              .fontWeight(.bold)
              .padding(.horizontal)
      ScrollView(.horizontal, showsIndicators: false) {
        ForEach(fetchPopular.moviesData[0..<fetchPopular.moviesData.count]) { movie in
          VStack {
            WebImage(url:  URL(string: "https://image.tmdb.org/t/p/original\(movie.backdropPath!)"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 200)
                    .cornerRadius(15)
            Text(movie.name!)
                    .font(.caption)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal)
          }
              .frame(height: 160)
        }
      }
    }
  }

}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
