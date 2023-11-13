import Foundation
import SwiftData

@Model class IngredientModel {
    @Attribute(.unique) private var id: UUID
    let strIngredient: String
    
    init(strIngredient: String = "") {
            
            id = UUID()
            self.strIngredient = strIngredient
        }
}
