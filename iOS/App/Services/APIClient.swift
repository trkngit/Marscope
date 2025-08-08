import Foundation

struct APIClient {
    static let shared = APIClient()
    private let baseURL = URL(string: "https://marscope-worker.marscope.workers.dev")! // replace with your worker URL

    func fetchTodayWeather() async throws -> MarsWeather {
        let url = baseURL.appending(path: "v1/mars/weather/today")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(MarsWeather.self, from: data)
    }
}
