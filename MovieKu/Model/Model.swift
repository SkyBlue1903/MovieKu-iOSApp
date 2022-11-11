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
  var crews: [Crew]?
  var trailers: [String]?
}


struct Crew: Codable {
  var crewId: Int
  var name: String?
  var job: String? // Actor or Director
  var character: String? // for Actor only
  var profilePath: String?
}
