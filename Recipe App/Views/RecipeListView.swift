//
//  ContentView.swift
//  Recipe App
//
//  Created by Martin Matzer on 21.09.21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Create a property which is linked to the data of the RecipeModel instance from the Tab-View, because this is a Sub-View of the Tab-View
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("Recipe List")
                    .bold()
                    .padding(.top)
                    .font(Font.custom("Avenir Heavy", size: 30))
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach (model.recipes){ r in
                            
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
                                        
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .font(Font.custom("Avenir Heavy", size: 18))
                                            RecipeHighlights(highlights: r.highlights)
                                        }.foregroundColor(Color.black)
                                        
                                    }

                                })
                        }
                        
                    }
                    
                }
                
            }
            
            
            .navigationBarHidden(true) // gives us the spaces of the title back
            .padding(.leading)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
