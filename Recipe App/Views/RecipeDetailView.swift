//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Martin Matzer on 21.09.21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe

    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
        
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingrediants
                VStack(alignment: .leading) {
                    
                    Text("Ingrediants")
                        .font(.headline)
                        .padding([.top, .bottom], 5.0)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 2.0)
                    }
                }
                .padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
