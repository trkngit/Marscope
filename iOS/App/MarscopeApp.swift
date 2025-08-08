import SwiftUI
import FirebaseCore

@main
struct MarscopeApp: App {
    @AppStorage("hasSeenDisclaimer") private var hasSeenDisclaimer: Bool = false

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if hasSeenDisclaimer {
                RootView()
            } else {
                DisclaimerView(onAccept: { hasSeenDisclaimer = true })
            }
        }
    }
}
