import Foundation
import SwiftData

@Model 
final class RecipeModel {
    @Attribute(.unique) private var id: UUID
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    var trash: Bool
    var archiveDate: Date
    
    init(
        strCategory: String = "",
        strCategoryThumb: String = "",
        strCategoryDescription: String = "",
        trash: Bool = false,
        archiveDate: Date = .now) {
            
            id = UUID()
            self.strCategory = strCategory
            self.strCategoryThumb = strCategoryThumb
            self.strCategoryDescription = strCategoryDescription
            self.trash = trash
            self.archiveDate = archiveDate
        }
}
