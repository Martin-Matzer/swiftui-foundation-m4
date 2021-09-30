//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Martin Matzer on 25.09.21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes:[Recipe]
    
    init() {
        /* Option 1 - creating an instance of DataService
        let dataService = DataService()
        self.recipes = dataService.getLocalJsonData()
        */
        
        /* Option 2 - just one line
        self.recipes = DataService().getLocalJsonData()
        */
        
        // Option 3 - using a static method
        self.recipes = DataService.getLocalJsonData()
        
    }
}
