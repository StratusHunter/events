//
// Created by Terence Baker on 27/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import Foundation

import Foundation

protocol StringResourceType {

    var bundle: Bundle { get }
    var key: String { get }
    var comment: String { get }
}

extension StringResourceType {

    func string(_ arguments: CVarArg...) -> String {

        let translation = NSLocalizedString(key, bundle: bundle, comment: comment)
        return (arguments.isEmpty) ? translation : String(format: translation, arguments: arguments)
    }
}

struct StringResource: StringResourceType {

    let bundle: Bundle
    let key: String
    let comment: String

    init(key: String, comment: String = "", bundle: Bundle = R.bundle) {

        self.key = key
        self.comment = comment
        self.bundle = bundle
    }
}
