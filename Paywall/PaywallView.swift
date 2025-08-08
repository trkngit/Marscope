import SwiftUI

struct PaywallView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Marscope Plus").font(.largeTitle).bold()
            Text("Unlock weekly/monthly/yearly insights and advanced Mars vibe breakdowns.")
                .multilineTextAlignment(.center).foregroundStyle(.secondary)
            VStack(spacing:8) {
                Label("Widgets & daily insights", systemImage: "sparkles")
                Label("Deeper compatibility reports", systemImage: "heart.circle")
                Label("Ad-free experience", systemImage: "nosign")
            }
            .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
            .padding().background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            Button("Continue") { /* TODO: StoreKit */ }.buttonStyle(.borderedProminent).padding(.top, 8)
            Button("Maybe later") { }.font(.footnote).foregroundStyle(.secondary)
        }.padding()
    }
}
