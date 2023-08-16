//
//  ErrorHandler.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import Foundation
enum ErrorHandler: Error {
    case FailWithError(Error?)
    case decoderError
    case customError(String)
}
