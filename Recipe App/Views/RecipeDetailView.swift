//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Martin Matzer on 21.09.21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServiceSize = 2

    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
        
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 30))
                    .padding(.top, 20)
                    .padding(.leading)
                
                // MARK: Service Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 16))
                    
                    Picker("", selection: $selectedServiceSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    .font(Font.custom("Avenir", size: 16))
                }.padding()
                
                
                // MARK: Ingrediants
                VStack(alignment: .leading) {
                    
                    Text("Ingrediants")
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .padding([.top, .bottom], 5.0)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetSerings: selectedServiceSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .padding([.top, .bottom], 5.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 2.0)
                            .font(Font.custom("Avenir", size: 16))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
