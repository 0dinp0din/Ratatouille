import Foundation
import SwiftData

@Model class IngredientModel {
    @Attribute(.unique) private var id: UUID
    @Attribute(.unique) let strIngredient: String
    var trash: Bool
    var archiveDate: Date
    
    init(strIngredient: String = "",
         trash: Bool = false,
         archiveDate: Date = .now) {
        
        id = UUID()
        self.strIngredient = strIngredient
        self.trash = trash
        self.archiveDate = archiveDate
    }
}
