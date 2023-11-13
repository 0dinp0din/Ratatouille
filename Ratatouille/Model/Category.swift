import Foundation
import SwiftData

@Model class CategoryModel {
    @Attribute(.unique) private var id: UUID
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    init(
        strCategory: String = "",
        strCategoryThumb: String = "",
        strCategoryDescription: String = "") {
            
            id = UUID()
            self.strCategory = strCategory
            self.strCategoryThumb = strCategoryThumb
            self.strCategoryDescription = strCategoryDescription
        }
}
