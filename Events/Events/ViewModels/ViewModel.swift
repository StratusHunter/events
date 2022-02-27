//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class ViewModel {

    private let apiClient: APIClient
    private let pageSize: Int

    private var loadedPage = 0
    private var currentPage = 1

    private(set) var loadingState = APILoadingState.idle {
        didSet {
            if (oldValue == loadingState) { return }
            loadingChanged?(oldValue, loadingState)
        }
    }

    private(set) var events = [EventContainer]()
    private(set) var locations = [LocationContainer]()

    var loadingChanged: ((APILoadingState, APILoadingState) -> ())?

    init(apiClient: APIClient = FatsomaAPIClient(), pageSize: Int = 10) {

        self.apiClient = apiClient
        self.pageSize = pageSize
    }

    func loadMoreEvents(onComplete: @escaping (Int, Int) -> ()) {

        if (loadingState == .loading || loadingState == .finished) { return }

        loadingState = .loading

        let target = FatsomaEventsAPITarget.events(page: currentPage, pageSize: pageSize)
        apiClient.performRequest(target: target) { [weak self] success, data in

                     guard let strongSelf = self, let data = data, success,
                           let response = try? JSONDecoder().decode(EventResponse.self, from: data),
                           let responseEvents = response.events, let responseLocations = response.locations
                     else {

                         self?.loadingState = .failed
                         onComplete(self?.events.count ?? 0, 0)
                         return
                     }

                     strongSelf.loadingState = (response.links?.next != nil) ? .idle : .finished

                     let previousCount = strongSelf.events.count
                     strongSelf.events += responseEvents
                     strongSelf.locations += responseLocations
                     strongSelf.currentPage = strongSelf.currentPage + 1
                     onComplete(previousCount, responseEvents.count)
                 }
    }
}
