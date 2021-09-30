//
//  DataService.swift
//  Recipe App
//
//  Created by Martin Matzer on 25.09.21.
//

import Foundation

class DataService {
    
    // static or type method can be used without creating an instance of DataService

    static func getLocalJsonData() -> [Recipe] {
        
        // Parse local JSON file and return it in an Array of type Recipe
        
        // Get a url path to the JSON File
        let pathString = Bundle.main.path(forResource: "Recipes", ofType: "json")
        
        // Guard: Check if pathString is not nil, otherwise do...
        guard pathString != nil else {
            return [Recipe]()
        }
       
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSONDecoder
            let decoder = JSONDecoder()
            
            do {
                let jsonRecipes = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ID's
                for r in jsonRecipes {
                    r.id = UUID()
                }
                
                // Return recipes
                return jsonRecipes
            }
            catch {
                // Error decoding JSON Data
                print(error)
            }
            
        }
        catch {
            // Error with getting the data
            print(error)
        }
        
        return [Recipe]()
    }
    
}
