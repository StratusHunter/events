//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

protocol ReuseIdentifierType {

    associatedtype ReusableType
    var identifier: String { get }
}

struct ReuseIdentifier<Reusable>: ReuseIdentifierType {

    typealias ReusableType = Reusable
    let identifier: String

    init(identifier: String) {

        self.identifier = identifier
    }
}
