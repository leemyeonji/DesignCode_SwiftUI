//
//  DesignCodeWidget.swift
//  DesignCodeWidget
//
//  Created by 임현지 on 2021/06/01.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DesignCodeWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        if family == .systemSmall {
            DesignCodeWidgetSmall()
        } else {
            DesignCodeWidgetMedium()
        }
        
    }
}

struct DesignCodeWidgetSmall: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Newest")
                .font(Font.footnote.smallCaps())
                .foregroundColor(.secondary)
            Text("Matched Geometry Effect")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("Learn how to quickly transition different Views")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(12)
    }
}

struct DesignCodeWidgetMedium: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Newest")
                .font(Font.footnote.smallCaps())
            ForEach(courseSections.indices) { index in
                if index < 2 {
                    CourseRow(item: courseSections[index])
                }
            }
        }
        .padding(12)
    }
}



@main
struct DesignCodeWidget: Widget {
    let kind: String = "DesignCodeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DesignCodeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct DesignCodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        DesignCodeWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
