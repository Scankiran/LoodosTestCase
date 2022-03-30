//
//  Optional+Extension.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation

extension Optional {
    func asStringOrEmpty() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
}
