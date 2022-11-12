//
//  MovieSummaryView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 11/11/22.
//

import SwiftUI

struct MovieSummaryView: View {

    var movie: Movie

  var body: some View {
    GroupBox() {
      DisclosureGroup("Movie Summary") {
        Divider().padding(.vertical, 3)
        VStack(alignment: .leading, spacing: 10) {
          // ----------------------------------

          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "star.fill")
              Text("Rating")
                      .bold()
            }
            Spacer(minLength: 60)
//            Text(movie.tagline!)
//                    .multilineTextAlignment(.trailing)
            VStack(alignment: .trailing, spacing: 5) {
              RatingView(rating: movie.voteAverage ?? 0.0)
              let newValue = movie.voteAverage ?? 0.0
              Text("\(String(format: "%.1f", newValue / 2 ?? 0.0)) out of 5")
            }

          }
                  .padding(.vertical, 5)

          // ----------------------------------

          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "calendar")
              Text("Release Date")
                      .bold()
            }
            Spacer(minLength: 60)
              Text(movie.releaseDate!)
                    .multilineTextAlignment(.trailing)
          }
                  .padding(.vertical, 5)

          // ----------------------------------


          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "rectangle.stack.fill")
              Text("Genres")
                      .bold()
            }
            Spacer(minLength: 60)
            Text(movie.genres!.joined(separator: ", "))
                    .multilineTextAlignment(.trailing)
          }
                  .padding(.vertical, 5)

          // ----------------------------------

          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "captions.bubble.fill")
              Text("Tagline")
                      .bold()
            }
            Spacer(minLength: 60)
              Text(movie.tagline! == "" ? "-" : movie.tagline!)
                    .multilineTextAlignment(.trailing)
          }
                  .padding(.vertical, 5)


          // ----------------------------------

          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "flag.and.flag.filled.crossed")
              Text("Production Countries")
                      .bold()
            }
            Spacer(minLength: 60)
            Text(movie.countries!.joined(separator: ", "))
                    .multilineTextAlignment(.trailing)
          }
                  .padding(.vertical, 5)

          // ----------------------------------

          HStack(alignment: .imageTitleAlignmentGuide) {
            Group {
              Image(systemName: "tag.fill")
              Text("Production Companies")
                      .bold()
            }
            Spacer(minLength: 60)
            Text(movie.productions!.joined(separator: ", "))
                    .multilineTextAlignment(.trailing)
          }
                  .padding(.vertical, 5)
        }
      }
    }
  }
}
