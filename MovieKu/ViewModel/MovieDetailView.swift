//
//  MovieDetailView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 10/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {

  @State private var descIsExpanded = false
  @Environment(\.colorScheme) var colorScheme

  var movie: Movie
//  var crews: Crew
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          if (movie.trailers!.isEmpty) {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.images![0])"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
          } else {
            HeaderDetailView(videoID: movie.trailers![0])
                    .frame(width: UIScreen.main.bounds.width, height: 250)
          }


          VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top) {
              // image and title
              WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath!)" ?? "https://raw.githubusercontent.com/koehlersimon/fallback/master/Resources/Public/Images/placeholder.jpg"))
                      .resizable()
                      .scaledToFill()
                      .frame(width: 100, height: 150)
                      .cornerRadius(15)
              VStack(alignment: .leading, spacing: 5) {
                Text("\(movie.name ?? "Unknown")").font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                VStack(alignment: .trailing, spacing: 5) {
                  Text(movie.description ?? "No description")
                          .multilineTextAlignment(.leading)
                          .lineLimit(4)
                  Button("Read more") {
                    descIsExpanded.toggle()
                  }
                          .sheet(isPresented: $descIsExpanded) {
                            MovieDescriptionView(movie: movie)
                          }
                }
              }
            }
            MovieSummaryView(movie: movie)
            let _ = print(movie.trailers!, movie.trailers?.count)
            if movie.trailers?.count != 0 {
              Text("Trailers")
                      .fontWeight(.bold)
                      .font(.system(.title2))
              ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .center, spacing: 15) {
                  ForEach(0..<movie.trailers!.count, id: \.self) { index in
                    HeaderDetailView(videoID: movie.trailers![index])
                            .frame(width: 350, height: 175)
                            .cornerRadius(10)
                  }
                }
              }
            }



            Text("Snapshots")
                    .fontWeight(.bold)
                    .font(.system(.title2))
            ScrollView(.horizontal, showsIndicators: true) {
              HStack(alignment: .center, spacing: 15) {
                ForEach(0..<movie.images!.count, id: \.self) { index in
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.images![index])"))
                            .resizable()
                            .placeholder {
                              VStack(spacing: 10) {
                                ProgressView()
                                        .frame(height: 175)
                                        .frame(maxWidth: .infinity)
                              }
                            }
                            .scaledToFit()
                            .frame(height: 175)
                            .cornerRadius(15)


                }
              }
            }
            Text("Casts")
                    .fontWeight(.bold)
                    .font(.system(.title2))
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .imageTitleAlignmentGuide, spacing: 15) {
                  ForEach(0..<movie.crews!.count, id: \.self) { index in
                    VStack {
                      WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.crews![index].profilePath!)"))
                              .placeholder {
                                VStack(spacing: 10) {
                                  Image("image-fallback")
                                          .resizable()
                                          .scaledToFill()
                                }
                              }
                              .resizable()
                              .transition(.fade(duration: 0.5))
                              .scaledToFill()
                              .frame(width: 150, height: 150)
                              .clipShape(Circle())
                      Text("\(movie.crews![index].name!)")
                              .fontWeight(.bold)
                              .multilineTextAlignment(.center)
                              .alignmentGuide(.imageTitleAlignmentGuide) { context in
                                context[.firstTextBaseline]
                              }
                              .lineLimit(1)
                      Text("\(movie.crews![index].character!)")
                              .foregroundColor(.gray)
                              .multilineTextAlignment(.center)
                              .alignmentGuide(.imageTitleAlignmentGuide) { context in
                                context[.firstTextBaseline]
                              }
                    }
                            .frame(width: 150)
                            .lineLimit(1)
                            .frame(maxHeight: .infinity)
                  }
                }

            }
            ImdbButtonView(movie: movie)
          }
                  .padding(.horizontal, 20)
                  .frame(maxWidth: 640, alignment: .center)
        }
                .navigationBarTitle(movie.name!, displayMode: .inline)
                .navigationBarHidden(true)
      }
              .edgesIgnoringSafeArea(.top)
    }
            .navigationViewStyle(StackNavigationViewStyle())
  }

  func checkIfActor(index: Int) -> Bool {
    if (movie.crews![index].character == "") {
      return false
    } else {
      return true
    }
  }
}

//struct MovieDetailView_Previews: PreviewProvider {

//  static var previews: some View {
//    MovieDetailView()
//  }
//}
