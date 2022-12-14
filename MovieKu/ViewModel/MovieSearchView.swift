//
//  MovieSearchView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 13/11/22.
//

import SwiftUI

struct MovieSearchView: View {

  @State private var searchText: String = ""
  @StateObject private var searchMovie = SearchMovie()


  var body: some View {
    NavigationView {
      List {
        if searchText.count > 0 {
          Text("Search result for: \(searchText) (\(searchMovie.searchResults.count) items)")
                  .fontWeight(.bold)
                  .font(.headline)
        }
        ForEach(searchMovie.searchResults) { movie in
          NavigationLink(destination: MovieDetailView(movie: movie)) {
            VStack(alignment: .leading) {
              Text(movie.originalName!)
              Text(movie.releaseDate!.prefix(4))
            }
          }

        }
      }
//              .listStyle(.plain)
              .navigationTitle("MovieKu")
              .searchable(text: $searchText, prompt: "Search movies & film")
              .onChange(of: searchText) { value in
                
                  if !value.isEmpty && value.count > 2 {
                    searchMovie.searchResults.removeAll()
                    searchMovie.searchTitle(query: value)
                  } else {
                    searchMovie.searchResults.removeAll()
                  }
                
              }
    }
  }
}


struct MovieSearchView_Previews: PreviewProvider {
  static var previews: some View {
    MovieSearchView()
  }
}
