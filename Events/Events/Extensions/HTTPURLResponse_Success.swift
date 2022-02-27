//
// Created by Terence Baker on 26/02/2022.
//

import Foundation

extension HTTPURLResponse {

    var hasSuccessStatusCode: Bool { 200..<300 ~= statusCode }
}
