import SwiftUI

struct CardView: View {
  var body: some View {
    Rectangle()
            .fill(Color.pink)
            .frame(height: 200)
            .border(Color.black)
            .padding()
  }
}