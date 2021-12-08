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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetSerings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1 // if ingredient.num = nil than it assign 1 to numerator
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single service size by multiplying the denominator by the recipe serving
            denominator *= recipeServings
            
            // Get target portion by multiplying nominator by target servings
            numerator *= targetSerings
            
            // Reduce fraction by greatest common divider
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
            
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast(1))
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
       
        return portion
    }
    
}


