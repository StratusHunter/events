//
// Created by Terence Baker on 26/02/2022.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var textLabel: UILabel!

    func setup(text: String) {

        textLabel.text = text
    }
}
