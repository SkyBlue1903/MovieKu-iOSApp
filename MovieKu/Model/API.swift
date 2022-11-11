//
// Created by Erlangga Anugrah Arifin on 10/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchData: ObservableObject {
  @Published var moviesData = [Movie]()

  init() {
    let url = "https://api.themoviedb.org/3/discover/movie?api_key=75a6dd0ad16baf57698a1da334b0e597&sort_by=popularity.desc&include_adult=false"
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
          let genres = i["genre_ids"].arrayValue.map {
            $0.stringValue
          }

          // crews
          let urlCrew = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=75a6dd0ad16baf57698a1da334b0e597&language=id-ID"
          AF.request(urlCrew).responseJSON { response in
            let result = response.data
            if result != nil {
              let json = JSON(result!)
              let data = json["cast"].arrayValue
              var crews = [Crew]()
              for i in data {
                let crewId = i["id"].intValue
                let name = i["name"].stringValue
                let job = i["known_for_department"].stringValue
                let character = i["character"].stringValue
                let profilePath = i["profile_path"].stringValue

                crews.append(Crew(crewId: crewId, name: name, job: job, character: character, profilePath: profilePath))
              }

              //trailers
              let urlTrailer = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=75a6dd0ad16baf57698a1da334b0e597"
              AF.request(urlTrailer).responseJSON { response in
                let result = response.data
                if result != nil {
                  let json = JSON(result!)
                  let data = json["results"].arrayValue
//                  let _ = print("URL: \(urlTrailer)\n\nResults: \(data)\n\n\n\n")
                  // check if site: "YouTube" and type: "Trailer"
                  let trailers = data.filter {
                    $0["site"].stringValue == "YouTube" && $0["type"].stringValue == "Trailer"
                  }
                  let trailerKeys = trailers.map {
                    $0["key"].stringValue
                  }
                  let movie = Movie(id: id, name: name, description: description, backdropPath: backdropPath, posterPath: posterPath, releaseDate: releaseDate, tagline: tagline, voteAverage: voteAverage, genres: genres, crews: crews, trailers: trailerKeys)
                  moviesData.append(movie)
                }
              }
            }
          }
        }
      }
    }
  }

}
