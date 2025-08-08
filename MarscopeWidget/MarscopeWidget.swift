import WidgetKit
import SwiftUI

struct MarscopeWidgetEntry: TimelineEntry {
    let date: Date
    let title: String
    let subtitle: String
}

struct MarscopeProvider: TimelineProvider {
    func placeholder(in context: Context) -> MarscopeWidgetEntry {
        MarscopeWidgetEntry(date: Date(), title: "Calm Orbits", subtitle: "Steady progress")
    }

    func getSnapshot(in context: Context, completion: @escaping (MarscopeWidgetEntry) -> ()) {
        completion(placeholder(in: context))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MarscopeWidgetEntry>) -> ()) {
        let entry = MarscopeWidgetEntry(date: Date(), title: "Calm Orbits", subtitle: "Steady progress")
        completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))))
    }
}

struct MarscopeWidgetEntryView: View {
    var entry: MarscopeWidgetEntry
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(entry.title).font(.headline)
            Text(entry.subtitle).font(.caption).foregroundStyle(.secondary)
        }.padding()
    }
}

struct MarscopeWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MarscopeWidget", provider: MarscopeProvider()) { entry in
            MarscopeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Mars Vibe")
        .description("Daily Mars vibe at a glance.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
