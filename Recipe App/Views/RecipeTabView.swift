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
            
            Text("Feature View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Feature")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
            
            
        }
        
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
