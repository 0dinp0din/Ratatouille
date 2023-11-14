import Foundation
import SwiftData

@Model class AreaModel {
    @Attribute(.unique) private var id: UUID
    @Attribute(.unique) let strArea: String
    let countryCode: String
    var trash: Bool
    var archiveDate: Date

    
    init(
        strArea: String = "",
        countryCode: String = "",
        trash: Bool = false,
        archiveDate: Date = .now) {
            
            id = UUID()
            self.strArea = strArea
            self.countryCode = countryCode
            self.trash = trash
            self.archiveDate = archiveDate
        }
}
