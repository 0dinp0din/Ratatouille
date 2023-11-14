import Foundation
import SwiftData

@Model class CategoryModel {
    @Attribute(.unique) private var id: UUID
    @Attribute(.unique) var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
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
