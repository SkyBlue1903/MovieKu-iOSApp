//
//  SnapshotView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 13/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SnapshotView: View {

  @State var image: String = ""

  var body: some View {
    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(image)"))
            .resizable()
            .scaledToFit()
            .frame(width: .infinity, height: .infinity)
            .padding(25)
            .cornerRadius(15)
            .rotationEffect(.degrees(-90))
  }
}

struct SnapshotView_Previews: PreviewProvider {
  static var previews: some View {
    SnapshotView(image: "tIadFMFzA6LcXaAaVpJmrd7waXQ.jpg")
  }
}
