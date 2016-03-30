//
//  Errors.swift
//  Openclassroom
//
//  Created by cordi on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

enum Error: ErrorType {
    // UIColorExtensionErrors
    case MissingHashMarkAsPrefix
    case UnableToScanHexValue
    case MismatchedHexStringLength
}

extension Error: CustomStringConvertible {
    var description: String {
        switch self {
        case .MissingHashMarkAsPrefix: return "Il manque le #"
        case .UnableToScanHexValue: return "Impossible de scanner la valeur HEX"
        case .MismatchedHexStringLength: return "La taille de la valeur est incorrecte"
        }
    }
}
