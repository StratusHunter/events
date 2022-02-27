//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class LocationContainer: RawObject {

    let location: Location

    //MARK - Decodable
    private enum CodingKeys: String, CodingKey { case attributes }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decode(Location.self, forKey: .attributes)
        try super.init(from: decoder)
    }
}
