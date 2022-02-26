//
// Created by Terence Baker on 26/02/2022.
//

import Foundation
import AnyCodable

class RawObject: Decodable, Equatable {
    
    let id: String
    let type: String

    //MARK - Equatable
    static func ==(lhs: RawObject, rhs: RawObject) -> Bool { lhs.id == rhs.id && lhs.type == rhs.type }
}
