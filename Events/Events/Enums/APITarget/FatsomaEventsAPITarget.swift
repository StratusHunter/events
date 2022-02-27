//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

enum FatsomaEventsAPITarget: APITarget {

    case events(page: Int, pageSize: Int)

    var base: String { "https://api.fatsoma.com/v1" }

    var path: String {
        switch (self) {
            case .events(let page, let pageSize):
                return "/events?fields[events]=name,starts-at&include=location&fields[locations]=name&page[number]=\(page)&page[size]=\(pageSize)"
        }
    }

    var method: HTTPMethod { .get }

    var parameters: APIParamEncoding? { nil }

    var headers: [String: String]? { nil }

    var sampleData: Data {
        switch (self) {
            case .events(_, _): return try! Data(resource: R.file.eventsJson)
        }
    }
}
