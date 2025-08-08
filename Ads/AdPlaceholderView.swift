import SwiftUI

struct AdPlaceholderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4]))
            Text("Ad Banner (Test)").font(.caption)
        }
        .frame(height: 50)
        .padding(.vertical, 8)
        .accessibilityLabel("Ad banner placeholder")
    }
}
