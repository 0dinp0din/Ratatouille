import Foundation
import SwiftData

@Model class AreaModel {
    @Attribute(.unique) private var id: UUID
    let strArea: String
    let countryCode: String

    
    init(
        strArea: String = "",
        countryCode: String = "") {
            
            id = UUID()
            self.strArea = strArea
            self.countryCode = countryCode
        }
}
