//
//  RecipeFeaturedView.swift
//  Recipe App
//
//  Created by Martin Matzer on 31.10.21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // Create a property which is linked to the data of the RecipeModel instance in the Tab-View
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
