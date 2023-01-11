//
//  ContentView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: vars
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = false
    let viewModel = ContentViewModel()
    @State private var allQuotes: [Quote] = []
    @State private var arabicQuotes: [QuoteAr] = []
    //@State private var currentCategory = String()
    
    //MARK: body
    var body: some View {
        VStack (alignment: .center) {
            //Quote
            GeometryReader { proxy in
                TabView {
                    /*ForEach(0...3, id: \.self) { quote in
                        Text("Hello")
                    }
                    .rotationEffect(.degrees(-90))
                    .frame(width: proxy.size.width, height: proxy.size.height )*/
                    
                    if viewModel.quoteService.isArabic {
                        ForEach(arabicQuotes, id: \.self) { quote in
                            QuoteView(quoteAr: quote)
                        }
                        .rotationEffect(.degrees(-90))
                        .frame(width: proxy.size.width , height: proxy.size.height )
                    } else {
                        ForEach(allQuotes, id: \.self) { quote in
                            QuoteView(quote: quote)
                        }
                        .rotationEffect(.degrees(-90))
                        .frame( width: proxy.size.width , height: proxy.size.height )
                    }
                }
                .frame(width: proxy.size.height, height: proxy.size.width)
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: proxy.size.width)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .onAppear{
            onAppear()
        }
        .background(
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .blur(radius: 12)
                .ignoresSafeArea()
        )
        .fullScreenCover(isPresented: $shouldShowOnboarding) {
            OnBoardings(shouldShowOnboarding: $shouldShowOnboarding)
        }
    }
    
    //MARK: function
    private func onAppear() {
        //currentCategory = UserDefaults.standard.string(forKey: "currentCategory") ?? "inspirational"
        if viewModel.quoteService.isArabic {
            arabicQuotes = viewModel.getArabicQuotes()
        } else {
            allQuotes = viewModel.getQuotesOf(category: "inspirational")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
