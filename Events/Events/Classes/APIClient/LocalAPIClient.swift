//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class LocalAPIClient: APIClient {

    //MARK - APIClient
    func performRequest(target: APITarget, onCompletion: @escaping (Bool, Data?) -> ()) {

        onCompletion(true, target.sampleData)
    }
}
