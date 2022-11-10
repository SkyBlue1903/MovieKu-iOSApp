//
// Created by Erlangga Anugrah Arifin on 10/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchData: ObservableObject {
  @Published var moviesData = [Movie]()

  init() {
    let url = "https://api.themoviedb.org/3/discover/movie?api_key=75a6dd0ad16baf57698a1da334b0e597&language=id-ID&region=id&sort_by=popularity.desc&include_adult=false"
    AF.request(url).responseJSON { [self] response in
      let result = response.data
      if result != nil {
        let json = JSON(result!)
        let data = json["results"].arrayValue
        for i in data {
          let id = i["id"].intValue
          let name = i["title"].stringValue
          let description = i["overview"].stringValue
          let backdropPath = i["backdrop_path"].stringValue
          let posterPath = i["poster_path"].stringValue
          let releaseDate = i["release_date"].stringValue
          let tagline = i["tagline"].stringValue
          let voteAverage = i["vote_average"].doubleValue
          let genres = i["genre_ids"].arrayValue.map { $0.stringValue }
             self.moviesData.append(Movie(id: id, name: name, backdropPath: backdropPath, posterPath: posterPath, releaseDate: releaseDate, tagline: tagline, voteAverage: voteAverage, genres: genres))
//          print(moviesData)
        }
      }

    }
  }
}
