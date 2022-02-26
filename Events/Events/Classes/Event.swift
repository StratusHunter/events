//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class Event: Decodable {

    let name: String
    let startsAt: String

    //MARK - Decodable
    private enum CodingKeys: String, CodingKey { case name, startsAt = "starts-at" }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        startsAt = try container.decode(String.self, forKey: .startsAt)
    }
}
