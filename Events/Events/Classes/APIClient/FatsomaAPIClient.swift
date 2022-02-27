//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

class FatsomaAPIClient: APIClient {

    let session: URLSession

    init(session: URLSession = URLSession.shared) {

        self.session = session
    }

    //MARK - APIClient
    func performRequest(target: APITarget, onCompletion: @escaping (Bool, Data?) -> ()) {

        session.dataTask(with: URLRequest(target: target)) { (data, response, error) in

                   let success = (response as? HTTPURLResponse)?.hasSuccessStatusCode ?? false
                   DispatchQueue.main.async { onCompletion(success, data) }
               }
               .resume()
    }
}
