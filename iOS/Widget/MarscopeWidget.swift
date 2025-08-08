import WidgetKit
import SwiftUI

struct MarscopeWidgetEntry: TimelineEntry {
    let date: Date
    let title: String
    let subtitle: String
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> MarscopeWidgetEntry {
        MarscopeWidgetEntry(date: Date(), title: "Calm Orbits", subtitle: "Steady progress today")
    }

    func getSnapshot(in context: Context, completion: @escaping (MarscopeWidgetEntry) -> ()) {
        let entry = MarscopeWidgetEntry(date: Date(), title: "Calm Orbits", subtitle: "Steady progress today")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MarscopeWidgetEntry>) -> ()) {
        let entry = MarscopeWidgetEntry(date: Date(), title: "Calm Orbits", subtitle: "Steady progress today")
        completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))))
    }
}

struct MarscopeWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.title).font(.headline)
            Text(entry.subtitle).font(.caption).foregroundStyle(.secondary)
        }
        .padding()
    }
}

@main
struct MarscopeWidget: Widget {
    let kind: String = "MarscopeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MarscopeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Mars Vibe")
        .description("Daily Mars vibe at a glance.")
        .supportedFamilies([.systemSmall])
    }
}
