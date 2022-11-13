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


  var body: some View {
    TabView {
      BrowseView()
              .tabItem {
                Label("Browse", systemImage: "square.stack.fill")
              }

      MovieSearchView()
              .tabItem {
                Label("Search", systemImage: "magnifyingglass")
              }
    }

  }
}


struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    ContentView()
  }
}
