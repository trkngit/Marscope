import SwiftUI

struct DisclaimerView: View {
    var onAccept: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
            Text(NSLocalizedString("disclaimer_title", comment: ""))
                .font(.title).bold()
            Text(NSLocalizedString("disclaimer_body", comment: ""))
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(NSLocalizedString("accept_continue", comment: "")) {
                onAccept()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
        }
        .padding()
    }
}
