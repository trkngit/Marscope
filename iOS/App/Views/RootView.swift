import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text(NSLocalizedString("tab_today", comment: ""))
                }
            HoroscopePeriodsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text(NSLocalizedString("tab_periods", comment: ""))
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text(NSLocalizedString("tab_settings", comment: ""))
                }
        }
        .tint(Color("AccentColor"))
    }
}

struct HoroscopePeriodsView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(NSLocalizedString("period_week", comment: ""), destination: Text("Weekly horoscope (placeholder)"))
                NavigationLink(NSLocalizedString("period_month", comment: ""), destination: Text("Monthly horoscope (placeholder)"))
                NavigationLink(NSLocalizedString("period_year", comment: ""), destination: Text("Yearly horoscope (placeholder)"))
            }
            .navigationTitle(NSLocalizedString("title_periods", comment: ""))
        }
    }
}
