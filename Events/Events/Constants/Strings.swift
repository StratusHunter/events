//
// Created by Terence Baker on 27/02/2022.
//

import Foundation

struct Strings {

    var loading: String { StringResource(key: "Loading").string() }
    var failedTryAgain: String { StringResource(key: "Failed. Try Again?").string() }
    var unknown: String { StringResource(key: "Unknown").string() }
}
