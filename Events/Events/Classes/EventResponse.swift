//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class EventResponse: Decodable {

    let links: Links?
    let events: [EventContainer]?
    let locations: [LocationContainer]?

    //MARK - Decodable
    private enum CodingKeys: String, CodingKey { case links, data, included }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        links = try? container.decodeIfPresent(Links.self, forKey: .links)
        events = try? container.decodeIfPresent([EventContainer].self, forKey: .data)

        locations = (try? container.decodeIfPresent([LocationContainer?].self, forKey: .included))?
                .compactMap { $0 }
                .filter { $0.type == FatsomaModelTypes.locations.rawValue }
    }
}
