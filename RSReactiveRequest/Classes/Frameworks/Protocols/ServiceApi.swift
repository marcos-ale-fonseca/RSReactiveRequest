//
//  ServiceApi.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public protocol ServiceApi {

    var api: String { get }

}

extension ServiceApi where Self: RawRepresentable, Self.RawValue == String {

    public var api: String {
        return rawValue
    }

}
