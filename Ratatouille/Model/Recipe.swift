import Foundation
import SwiftData

@Model 
final class RecipeModel {
    @Attribute(.unique) private var id: UUID
    var strMeal: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    var trash: Bool
    var archiveDate: Date
    var category: CategoryModel?
    var area: AreaModel?
    var Ingredient: IngredientModel?
    
    init(
        strMeal: String = "",
        strCategory: String = "",
        strCategoryThumb: String = "",
        strCategoryDescription: String = "",
        trash: Bool = false,
        archiveDate: Date = .now) {
            
            id = UUID()
            self.strMeal = strMeal
            self.strCategory = strCategory
            self.strCategoryThumb = strCategoryThumb
            self.strCategoryDescription = strCategoryDescription
            self.trash = trash
            self.archiveDate = archiveDate
        }
}
