import SwiftUI

struct TodayView: View {
    @StateObject private var vm = TodayViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                if let w = vm.weather {
                    MarsVibeCard(weather: w)
                } else if vm.isLoading {
                    ProgressView()
                } else if let err = vm.errorMessage {
                    Text(err).foregroundColor(.red)
                    Button(NSLocalizedString("retry", comment: "")) {
                        Task { await vm.load() }
                    }
                }

                List(vm.horoscopeLines, id: \.self) { line in
                    Text(line)
                }
                .listStyle(.insetGrouped)
            }
            .padding()
            .navigationTitle(NSLocalizedString("title_today", comment: ""))
            .task {
                await vm.load()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task { await vm.scheduleDailyNotification() }
                    } label: {
                        Image(systemName: "bell")
                    }
                    .help(NSLocalizedString("enable_notifications", comment: ""))
                }
            }
        }
    }
}

struct MarsVibeCard: View {
    let weather: MarsWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(NSLocalizedString("mars_vibe_today", comment: ""))
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(vibeTitle(for: weather))
                .font(.largeTitle).bold()
                .foregroundStyle(LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing))
            Text(vibeSubtitle(for: weather))
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Divider()
            HStack {
                Label(String(format: NSLocalizedString("temp_range_fmt", comment: ""), Int(weather.tempMinC), Int(weather.tempMaxC)), systemImage: "thermometer")
                Spacer()
                Label(String(format: NSLocalizedString("pressure_fmt", comment: ""), Int(weather.pressurePa ?? 0)), systemImage: "gauge")
                Spacer()
                Label(String(format: NSLocalizedString("wind_fmt", comment: ""), Int(weather.windAvgMps ?? 0)), systemImage: "wind")
            }
            .font(.footnote)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.orange.opacity(0.2)))
    }
}

private func vibeTitle(for w: MarsWeather) -> String {
    if w.tempMaxC < -60 { return NSLocalizedString("vibe_cold_title", comment: "") }
    if (w.tempMaxC - w.tempMinC) > 25 { return NSLocalizedString("vibe_swings_title", comment: "") }
    if let p = w.pressurePa, p > 750 { return NSLocalizedString("vibe_structure_title", comment: "") }
    return NSLocalizedString("vibe_calm_title", comment: "")
}

private func vibeSubtitle(for w: MarsWeather) -> String {
    if w.tempMaxC < -60 { return NSLocalizedString("vibe_cold_sub", comment: "") }
    if (w.tempMaxC - w.tempMinC) > 25 { return NSLocalizedString("vibe_swings_sub", comment: "") }
    if let p = w.pressurePa, p > 750 { return NSLocalizedString("vibe_structure_sub", comment: "") }
    return NSLocalizedString("vibe_calm_sub", comment: "")
}
