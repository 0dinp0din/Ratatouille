import Foundation
import SwiftData

@Model 
final class RecipeModel {
    @Attribute(.unique) private var id: UUID
    @Attribute(.unique) var strMeal: String
    var strMealThumb: String
    var strInstructions: String
    var trash: Bool
    var archiveDate: Date
    var favorite: Bool
    var category: CategoryModel?
    var area: AreaModel?
    
    init(
        strMeal: String = "",
        strMealThumb: String = "",
        favorite: Bool = false,
        strInstructions: String = "",
        trash: Bool = false,
        archiveDate: Date = .now) {
            
            id = UUID()
            self.strMeal = strMeal
            self.strMealThumb = strMealThumb
            self.favorite = favorite
            self.strInstructions = strInstructions
            self.trash = trash
            self.archiveDate = archiveDate
        }
}
