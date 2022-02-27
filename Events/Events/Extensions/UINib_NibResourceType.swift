//
// Created by Terence Baker on 26/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import UIKit

extension UINib {

    convenience init(resource: NibResourceType) {

        self.init(nibName: resource.name, bundle: resource.bundle)
    }
}