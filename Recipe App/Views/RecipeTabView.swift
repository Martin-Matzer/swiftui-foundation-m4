//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Martin Matzer on 30.09.21.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        
        TabView {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }.environmentObject(RecipeModel())  // Create an enviroment object of RecipeModel -> all Sub-Views can access to this instance of RecipeModel
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
