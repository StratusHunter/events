//
// Created by Terence Baker on 26/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import Foundation

struct NoUrlForResourceError: Error {
}

extension Data {

    init(resource: FileResourceType) throws {

        guard let url = resource.url() else { throw NoUrlForResourceError() }
        try self.init(contentsOf: url)
    }
}
