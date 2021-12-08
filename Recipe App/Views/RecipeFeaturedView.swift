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
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top)
                .font(.largeTitle)
            
            GeometryReader { geo in
            
            TabView {
                
                // Loop through each recipe
                ForEach(0..<model.recipes.count) { index in
                    
                    // Only show those which are featured
                    if model.recipes[index].featured {
                        
                        // Recipe card button
                        Button {
                            self.isDetailViewShowing = true
                        } label: {
                            
                            // Recipe card
                            ZStack {
          
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    
                                    Text(model.recipes[index].name)
                                        .font(.title)
                                        .padding(5)
                                }
                                
                            }
                            
                        }
                        .sheet(isPresented: $isDetailViewShowing) {
                            // Show recipe detail view
                            RecipeDetailView(recipe: model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 50, height: geo.size.height - 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -6, y: 6)
                    }
                    
                    
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
        
            VStack(alignment: .leading, spacing: 5) {
                Text("Preparation time: 1 hour")
                Text("Healthy")
            }.padding(.leading)
            
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
