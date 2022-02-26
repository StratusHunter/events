//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

/// Allows us to create an API entity with a series of endpoints it can communicate with
protocol APITarget {

    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: APIParamEncoding? { get }
    var headers: [String: String]? { get }
    var sampleData: Data { get }
}
