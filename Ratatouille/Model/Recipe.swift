import Foundation
import SwiftData

@Model 
final class RecipeModel {
    @Attribute(.unique) private var id: UUID
    var strMeal: String
    let strCategory: String
    let strMealThumb: String
    let strCategoryDescription: String
    var trash: Bool
    var archiveDate: Date
    var category: CategoryModel?
    var area: AreaModel?
    var Ingredient: IngredientModel?
    
    init(
        strMeal: String = "",
        strCategory: String = "",
        strMealThumb: String = "",
        strCategoryDescription: String = "",
        trash: Bool = false,
        archiveDate: Date = .now) {
            
            id = UUID()
            self.strMeal = strMeal
            self.strCategory = strCategory
            self.strMealThumb = strMealThumb
            self.strCategoryDescription = strCategoryDescription
            self.trash = trash
            self.archiveDate = archiveDate
        }
}
