//
//  CardView.swift
//  SwiftUISesi7
//
//  Created by Dion Aditya on 10/12/22.
//

import Foundation

struct CardView: Identifiable {
    let id = UUID()
    var image: String
    var category: String
    var heading: String
    var author: String
    var rating: Int
    var excerpt: String
}
