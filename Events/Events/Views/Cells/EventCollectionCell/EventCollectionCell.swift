//
// Created by Terence Baker on 26/02/2022.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var startLabel: UILabel!

    func setup(event: EventContainer?, location: LocationContainer?) {

        nameLabel.text = event?.event.name ?? R.string.unknown
        startLabel.text = event?.event.startsAt ?? R.string.unknown
        locationLabel.text = location?.location.name ?? R.string.unknown
    }
}
