//
// Created by Terence Baker on 26/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import UIKit

protocol NibResourceType {

    var name: String { get }
    var bundle: Bundle { get }
}

extension NibResourceType {

    func instantiate(withOwner ownerOrNil: Any?, options optionsOrNil: [UINib.OptionsKey: Any]? = [:]) -> [Any] {

        UINib(resource: self).instantiate(withOwner: ownerOrNil, options: optionsOrNil)
    }
}

class NibResource<T>: NibResourceType {

    let name: String
    let bundle: Bundle

    init(clazz: T.Type, name: String? = nil, bundle: Bundle = R.bundle) {

        self.name = name ?? String(describing: clazz)
        self.bundle = bundle
    }

    func instance(owner: Any? = nil) -> T? { instantiate(withOwner: owner).first as? T }

    func firstView(owner: Any?) -> UIView? { instantiate(withOwner: owner).first as? UIView }
}

class CellResource<T>: NibResource<T>, ReuseIdentifierType {

    typealias ReusableType = T
    let identifier: String

    init(clazz: T.Type, name: String? = nil, bundle: Bundle = R.bundle, identifier: String? = nil) {

        self.identifier = identifier ?? String(describing: clazz)
        super.init(clazz: clazz, name: name, bundle: bundle)
    }
}
