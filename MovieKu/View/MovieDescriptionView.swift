//
//  MovieDescriptionView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 11/11/22.
//

import SwiftUI

struct MovieDescriptionView: View {

  @Environment(\.dismiss) var dismiss
  var movie: Movie

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: true) {
        VStack(alignment: .leading) {
          Text(movie.name ?? "Unknown")
                  .font(.title)
                  .fontWeight(.heavy)
                  .multilineTextAlignment(.leading)
                  .padding(.horizontal, 15)
                  .padding(.top, 10)
          Text(movie.description ?? "No description")
                  .multilineTextAlignment(.leading)
                  .padding()

        }
      }
              .navigationTitle("Description")

              .navigationBarTitleDisplayMode(.inline)
              .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                  Button("Done") {
                    dismiss()
                  }
                }
              }
    }
  }
}

//struct MovieDescriptionView_Previews: PreviewProvider {

//    static var previews: some View {
//        MovieDescriptionView(movie: <#T##Movie##MovieKu.Movie#>)
//    }
//}
