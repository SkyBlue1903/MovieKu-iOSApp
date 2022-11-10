//
//  RatingView.swift
//  MovieKu
//
//  Created by Erlangga Anugrah Arifin on 10/11/22.
//
//

import SwiftUI

struct RatingView: View {
  var rating: Double
  var body: some View {
    HStack {
      var newValue = rating / 2
      ForEach(1..<6) { item in
        Image(systemName: item <= Int(newValue) ? "star.fill" : item == Int(newValue) + 1 && rating.truncatingRemainder(dividingBy: 1) != 0 ? "star.leadinghalf.fill" : "star")
                .foregroundColor(.yellow)
      }
    }
  }

}