import SwiftUI

struct SettingsView: View {
    @AppStorage("notifEnabled") private var notifEnabled = false
    @AppStorage("dailyHour") private var dailyHour: Int = 9

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(NSLocalizedString("section_notifications", comment: ""))) {
                    Toggle(NSLocalizedString("toggle_daily", comment: ""), isOn: $notifEnabled)
                    Stepper(value: $dailyHour, in: 6...22) {
                        Text(String(format: NSLocalizedString("daily_time_fmt", comment: ""), dailyHour))
                    }
                    Button(NSLocalizedString("btn_request_perm", comment: "")) {
                        Task { await NotificationScheduler.requestPermission() }
                    }
                }

                Section(header: Text(NSLocalizedString("section_legal", comment: ""))) {
                    NavigationLink(NSLocalizedString("disclaimer_title", comment: ""), destination: DisclaimerView(onAccept: {}))
                    Link(NSLocalizedString("contact_support", comment: ""), destination: URL(string: "mailto:trknsrv@gmail.com")!)
                }
            }
            .navigationTitle(NSLocalizedString("title_settings", comment: ""))
        }
    }
}
