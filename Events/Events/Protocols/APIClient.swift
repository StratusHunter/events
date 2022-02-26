//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

/// A way to perform API requests without locking us to a particular implementation
protocol APIClient {

    func performRequest(target: APITarget, onCompletion: @escaping (Bool, Data?) -> ())
}
