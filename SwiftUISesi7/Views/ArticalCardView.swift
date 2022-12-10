//
//  ArticalCardView.swift
//  SwiftUISesi7
//
//  Created by Dion Aditya on 10/12/22.
//

import SwiftUI

struct ArticalCardView: View {
    // MARK: Properties
    let card: CardView
    let isActive: Bool
    let cardViews: [CardView]
    
    // MARK: Body
    var body: some View {
        let rating = Array(repeating: 0, count: card.rating)
        
        if isActive {
            VStack {
                VStack {
                    Image(card.image)
                        .resizable()
                        .scaledToFill()
                        .fontDesign(.rounded)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        CardHeaderView(card: card) //  VStack
                        
                        RatingView(rating: rating)
                        
                        CardContentView(card: card)
                    }// VStack
                    .padding()
                } // VStack
                .cornerRadius(20)
            } // VStack
            .transition(.scaleAndOffset)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
        }
    }
}

// MARK: Preview
struct ArticalCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticalCardView(card: CardView(image: "navigation", category: "SwiftUI", heading: "Navigation API", author: "iSwift Bootcamp", rating: 4, excerpt: "Leverage programmatic control over your app’s navigation behavior to set its launch state, manage transitions between size classes, respond to deep links, and more."), isActive: true, cardViews: [CardView(image: "navigation", category: "SwiftUI", heading: "Navigation API", author: "iSwift Bootcamp", rating: 4, excerpt: "Leverage programmatic control over your app’s navigation behavior to set its launch state, manage transitions between size classes, respond to deep links, and more.")])
    }
}

// MARK: Extension
extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .center), removal: .offset(x: 450, y: 40).combined(with: .scale))
    }
}

// MARK: RatingVAiew
struct RatingView: View {
    // MARK: Properties
    let rating: [Int]
    
    // MARK: Body
    var body: some View {
        HStack(spacing: 2) {
            ForEach(rating, id: \.self) { letter in
                Image(systemName: "star.fill")
                    .font(.system(size: 16))
                    .padding(.vertical)
                    .symbolRenderingMode(.multicolor)
            }
        }
    }
}

struct CardHeaderView: View {
    let card: CardView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(card.category)
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontDesign(.rounded)
            
            Text(card.heading)
                .font(.system(size: 30))
                .fontWeight(.bold)
            
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(card.author)
                .font(.footnote)
                .fontWeight(.light)
                .fontDesign(.rounded)
        }
    }
}

struct CardContentView: View {
    let card: CardView
    var body: some View {
        Text(card.excerpt)
            .font(.body)
            .foregroundColor(.gray)
            .lineLimit(nil)
            .fontDesign(.rounded)
    }
}
