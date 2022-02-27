//
// Created by Terence Baker on 26/02/2022.
//

import UIKit

extension UICollectionView {

    func register<Resource: NibResourceType & ReuseIdentifierType>(_ nibResource: Resource) where Resource.ReusableType: UICollectionViewCell {

        register(UINib(resource: nibResource), forCellWithReuseIdentifier: nibResource.identifier)
    }

    func dequeue<Resource: NibResourceType & ReuseIdentifierType>(_ nibResource: Resource, for indexPath: IndexPath) -> Resource.ReusableType where Resource.ReusableType: UICollectionViewCell {

        dequeueReusableCell(withReuseIdentifier: nibResource.identifier, for: indexPath) as! Resource.ReusableType
    }
}
