//
// Created by Erlangga Anugrah Arifin on 12/11/22.
//

import SwiftUI

extension VerticalAlignment {
  /// A custom alignment for image titles.
  private struct ImageTitleAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      // Default to bottom alignment if no guides are set.
      context[VerticalAlignment.top]
    }
  }

  /// A guide for aligning titles.
  static let imageTitleAlignmentGuide = VerticalAlignment(
          ImageTitleAlignment.self
  )
}

