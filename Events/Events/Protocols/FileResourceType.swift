//
// Created by Terence Baker on 26/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import Foundation

protocol FileResourceType {

    var name: String { get }
    var pathExtension: String { get }
    var bundle: Bundle { get }
}

extension FileResourceType {

    var fullName: String { [name, pathExtension].joined(separator: ".") }

    func path() -> String? { bundle.path(forResource: self) }

    func url() -> URL? { bundle.url(forResource: self) }
}

struct FileResource: FileResourceType {

    let name: String
    let pathExtension: String
    let bundle: Bundle

    init(name: String, pathExtension: String, bundle: Bundle = R.bundle) {

        self.bundle = bundle
        self.name = name
        self.pathExtension = pathExtension
    }
}
