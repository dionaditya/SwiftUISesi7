//
//  ContentView.swift
//  SwiftUISesi7
//
//  Created by Dion Aditya on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var cardViews = [
        CardView(image: "navigation", category: "SwiftUI", heading: "Navigation API", author: "iSwift Bootcamp", rating: 4, excerpt: "Leverage programmatic control over your app’s navigation behavior to set its launch state, manage transitions between size classes, respond to deep links, and more."),
        CardView(image: "charts", category: "SwiftUI", heading: "Swift Charts", author: "iSwift Bootcamp", rating: 5, excerpt: "Visualize data with highly customizable charts that look and feel great across all Apple platforms. Swift Charts uses the compositional syntax of SwiftUI to create views with many possibilities, from line and bar charts to advanced types like stream graphs."),
        CardView(image: "layout", category: "macOS", heading: "Advance Layout Control", author: "iSwift Bootcamp", rating: 4, excerpt: "Build advanced, reusable layouts to power the design of your app. In addition to VStack and HStack, SwiftUI now offers a new Grid API to simultaneously align views both horizontally and vertically."),
        CardView(image: "share", category: "iOS", heading: "New Share API", author: "iSwift Bootcamp", rating: 5, excerpt: "The new Transferable protocol makes your data available for the clipboard, drag and drop, and the Share Sheet, which can now be invoked directly using SwiftUI."),
    ]
    @State private var activeContentIndex: Int = 0
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Whats new in Swift Ui?")
                .font(.system(size: 42))
                .fontDesign(.rounded)
                .frame(width: 250)
                .fontWeight(.bold)
                .padding(.vertical)
            
            ForEach(Array(cardViews.enumerated()), id: \.offset) { index, card in
                ArticalCardView(card: card, isActive: activeContentIndex == index, cardViews: cardViews)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            let isLastIndex = cardViews.endIndex - 1 == index
                            activeContentIndex = isLastIndex ? 0 : index + 1
                        }
                    }

            } // Lopp
        }
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
