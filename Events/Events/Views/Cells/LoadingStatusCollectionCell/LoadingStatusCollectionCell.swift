//
// Created by Terence Baker on 27/02/2022.
//

import UIKit

class LoadingStatusCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var textLabel: UILabel!

    func setup(status: APILoadingState) {

        activityIndicator.isHidden = (status != .loading)
        if (!activityIndicator.isHidden) { activityIndicator.startAnimating() }
        textLabel.text = text(for: status)
    }

    private func text(for status: APILoadingState) -> String {

        switch (status) {
            case .loading: return R.string.loading
            case .failed: return R.string.failedTryAgain
            case .idle, .finished: return ""
        }
    }
}
