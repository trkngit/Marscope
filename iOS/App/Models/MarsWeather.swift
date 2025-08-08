import Foundation

struct MarsWeather: Codable {
    let sol: Int
    let season: String
    let tempMinC: Double
    let tempMaxC: Double
    let pressurePa: Double?
    let windAvgMps: Double?
    let source: String
    let fetchedAt: Date
}
