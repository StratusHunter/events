//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

extension URLRequest {

    init(target: APITarget) {

        let rawUrlString = target.base + target.path
        let components = URLComponents(string: rawUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        self.init(url: components.url!)
        httpMethod = target.method.rawValue
    }
}
