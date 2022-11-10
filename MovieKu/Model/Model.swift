//
// Created by Erlangga Anugrah Arifin on 10/11/22.
//

import Foundation

struct Movie: Codable, Identifiable {
  var id: Int
  var name: String?
  var description: String?
  var backdropPath: String?
  var posterPath: String?
  var releaseDate: String?
  var tagline: String?
  var voteAverage: Double?
  var genres: [String]?

}

