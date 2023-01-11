//
//  BibliWidget.swift
//  BibliWidget
//
//  Created by Zahra Majed Alzawad on 18/06/1444 AH.
//

import WidgetKit
import SwiftUI
import Intents

//retrieve data for your widgets while they are in various states
struct Provider: TimelineProvider {
    let quoteService = QuoteService()
    
    //1- Placeholders are basically the loading state of the widget, this method has to return some value instantly
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quote: quoteService.getRandomQuote())
    }
    
    //2- get an entry for the widget “snapshot” state.
    //Widget snapshots are previews of the widget
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), quote: quoteService.getRandomQuote())
        completion(entry)
        //Notice that you return the snapshot entry using a completion handler so you have time to access Core Data or make a network call.
    }
    
    //3- retrieve a timeline (which is a list of entries) for the widget.
    //This is where the widget data comes from when a user places the widget on their home screen
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let quote =  quoteService.getRandomQuote()
            var entry = SimpleEntry(date: entryDate, quote: quote)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


//view model for the widget
struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: Quote
}

// root view of your widget
struct BibliWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        WidgetQuoteView(quote: entry.quote)
    }
}
struct WidgetQuoteView: View {
    var quote: Quote
    
    var body: some View {
        VStack(alignment: .center) {
            Text(getQuoteAndAuthor(quote: quote).0)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .shadow(color: .black, radius: 2)
            Text(getQuoteAndAuthor(quote: quote).1)
                .font(.system(size: 16, weight: .light, design: .rounded))
                .shadow(color: .black, radius: 2)
        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
    }
    
    func getQuoteAndAuthor(quote: Quote) -> (String, String) {
        let components = quote.quote.components(separatedBy: "—")
        return (components[0], components[1])
    }
}


@main
struct BibliWidget: Widget {
    let kind: String = "BibliWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BibliWidgetEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.brown)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")

        /*
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            BibliWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")*/
    }
}

/*struct BibliWidget_Previews: PreviewProvider {
    static var previews: some View {
        BibliWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
*/