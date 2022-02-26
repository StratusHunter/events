//
// Created by Terence Baker on 26/02/2022.
//
// Credit: https://github.com/mac-cain13/R.swift.Library

import Foundation

extension Bundle {

    func url(forResource resource: FileResourceType) -> URL? {

        url(forResource: resource.name, withExtension: resource.pathExtension)
    }

    func path(forResource resource: FileResourceType) -> String? {

        path(forResource: resource.name, ofType: resource.pathExtension)
    }
}
