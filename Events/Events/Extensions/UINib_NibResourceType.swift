//
// Created by Terence Baker on 26/02/2022.
//

import UIKit

extension UINib {

    convenience init(resource: NibResourceType) {

        self.init(nibName: resource.name, bundle: resource.bundle)
    }
}