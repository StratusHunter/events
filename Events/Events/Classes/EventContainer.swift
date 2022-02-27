//
// Created by Terence Baker on 26/02/2022.
//

import Foundation
import AnyCodable

class EventContainer: RawObject {

    let event: Event
    let location: String?

    //MARK - Decodable
    private enum CodingKeys: String, CodingKey { case attributes, relationships }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        event = try container.decode(Event.self, forKey: .attributes)

        let relationships = try? container.decodeIfPresent([String: AnyDecodable].self, forKey: .relationships)
        
        //TODO - With more time I would want to model this a bit better.
        let locations = relationships?["location"]?.value as? [String:Any]
        let data = locations?["data"] as? [String:Any]
        location = data?["id"] as? String
        
        try super.init(from: decoder)
    }
}
