import Foundation

@MainActor
final class TodayViewModel: ObservableObject {
    @Published var weather: MarsWeather?
    @Published var horoscopeLines: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            // Try API; if fails, use fallback mock
            do {
                weather = try await APIClient.shared.fetchTodayWeather()
            } catch {
                weather = TodayViewModel.mockWeather()
            }
            horoscopeLines = TodayViewModel.mockHoroscope()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func scheduleDailyNotification() async {
        await NotificationScheduler.requestPermission()
        await NotificationScheduler.scheduleDaily(hour: 9)
    }

    static func mockWeather() -> MarsWeather {
        .init(sol: 1234, season: "Northern Fall", tempMinC: -85, tempMaxC: -55, pressurePa: 760, windAvgMps: 5, source: "fallback", fetchedAt: Date())
    }

    static func mockHoroscope() -> [String] {
        [
            NSLocalizedString("mock_line_1", comment: ""),
            NSLocalizedString("mock_line_2", comment: ""),
            NSLocalizedString("mock_line_3", comment: "")
        ]
    }
}
