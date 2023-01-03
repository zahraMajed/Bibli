//
//  ContentView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: vars
    let viewModel = ContentViewModel()
    @State private var allQuotes: [Quote] = []
    
    @State private var currentCategory = String()
    
    //MARK: body
    var body: some View {
        ZStack {
            //Quote
            GeometryReader { proxy in
                TabView {
                    ForEach(allQuotes, id: \.self) { quote in
                        QuoteView(quote: quote)
                    }
                    .rotationEffect(.degrees(-90))
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                }
                .frame(
                    width: proxy.size.height,
                    height: proxy.size.width
                )
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: proxy.size.width)
                .tabViewStyle(
                    PageTabViewStyle(indexDisplayMode: .never)
                )
            }
            
        }.onAppear{
            onAppear()
        }.background(
            Color.brown
        )
        .ignoresSafeArea()
    }
    
    //MARK: function
    private func onAppear() {
        currentCategory = UserDefaults.standard.string(forKey: "currentCategory") ?? "inspirational"
        allQuotes = viewModel.getQuotesOf(category: currentCategory)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
