//
//  RecipeHighlights.swift
//  Recipe App
//
//  Created by Martin Matzer on 01.01.22.
//

// Because I want to use this highlights in different Views, I created an seperated view for that to make it reusable

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        // Loop through the highlights and build the String
        for index in 0..<highlights.count {
            
            // If it is the last item, don't add a comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 16))
        
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
