//
//  ContentView.swift
//  Recipe App
//
//  Created by Martin Matzer on 21.09.21.
//

import SwiftUI

struct RecipeAppView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            
            
            List(model.recipes){ r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        // MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5.0)
                            
                            Text(r.name)
                        }
                    })
                
                
                
            }
            .navigationBarTitle("All Recipes")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeAppView()
    }
}