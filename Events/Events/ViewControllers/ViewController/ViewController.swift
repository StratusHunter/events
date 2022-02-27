//
//  ViewController.swift
//  Events
//
//  Created by Terence Baker on 26/02/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private enum Sections: Int, CaseIterable { case events = 0, status }

    @IBOutlet private weak var collectionView: UICollectionView!
    private let viewModel: ViewModel

    init(viewModel: ViewModel = ViewModel()) {

        self.viewModel = viewModel

        let nib = R.nib.viewController
        super.init(nibName: nib.name, bundle: nib.bundle)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) is not supported") }

    override func viewDidLoad() {

        super.viewDidLoad()

        viewModel.loadingChanged = { [weak self] in self?.loadStatusCell(oldValue: $0, newValue: $1) }
        setupCollectionView()
        loadMoreEvents()
    }

    private func setupCollectionView() {

        collectionView.register(R.nib.loadingStatusCollectionCell)
        collectionView.register(R.nib.eventCollectionCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func shouldShowLoadingStatus(_ state: APILoadingState) -> Bool {

        switch (state) {
            case .idle, .finished: return false
            case .loading, .failed: return true
        }
    }

    private func loadStatusCell(oldValue: APILoadingState, newValue: APILoadingState) {

        let indexes = [IndexPath(row: 0, section: Sections.status.rawValue)]

        let oldShouldShow = shouldShowLoadingStatus(oldValue)
        let newShouldShow = shouldShowLoadingStatus(newValue)

        if (!oldShouldShow && newShouldShow) {

            collectionView.insertItems(at: indexes)
        }
        else if (oldShouldShow && !newShouldShow) {

            collectionView.deleteItems(at: indexes)
        }
        else if (oldShouldShow && newShouldShow) {

            collectionView.reloadItems(at: indexes)
        }
    }

    private func loadMoreEvents() {

        viewModel.loadMoreEvents { [collectionView] previous, new in

                     let indexes = (0..<new).map { IndexPath(row: previous + $0, section: Sections.events.rawValue) }
                     if (!indexes.isEmpty) { collectionView?.insertItems(at: indexes) }
                 }
    }

    //MARK - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        CGSize(width: collectionView.bounds.width, height: 100)
    }

    //MARK - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        //Kept this simple as just load the next cells if we display the last cell in the current list.
        if (indexPath.section == Sections.events.rawValue && indexPath.row >= viewModel.events.count - 1) {

            loadMoreEvents()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {

        if (indexPath.section == Sections.status.rawValue && viewModel.loadingState == .failed) {

            loadMoreEvents()
        }
    }

    //MARK - UICollectionViewDataSource
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch (Sections(rawValue: section)) {
            case .events: return viewModel.events.count
            case .status: return shouldShowLoadingStatus(viewModel.loadingState) ? 1 : 0
            default: return 0
        }
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch (Sections(rawValue: indexPath.section)) {
            case .events:
                let cell = collectionView.dequeue(R.nib.eventCollectionCell, for: indexPath)
                cell.setup(text: "cell \(indexPath.row)")
                return cell
            case .status:
                let cell = collectionView.dequeue(R.nib.loadingStatusCollectionCell, for: indexPath)
                cell.setup(status: viewModel.loadingState)
                return cell
            default: return UICollectionViewCell() //Should never get here
        }
    }

    internal func numberOfSections(in collectionView: UICollectionView) -> Int { Sections.allCases.count }
}