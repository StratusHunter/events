//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

struct Nibs {

    var viewController: NibResource<ViewController> { NibResource(clazz: ViewController.self) }

    var eventCollectionCell: CellResource<EventCollectionCell> { CellResource(clazz: EventCollectionCell.self) }
    var loadingStatusCollectionCell: CellResource<LoadingStatusCollectionCell> { CellResource(clazz: LoadingStatusCollectionCell.self) }
}
