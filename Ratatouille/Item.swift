//
//  Item.swift
//  Ratatouille
//
//  Created by Odin Trefall on 13/11/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
