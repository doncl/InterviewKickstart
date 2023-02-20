//
//  ResourceTestable.swift
//  IntersectionOfThreeSortedArraysTests
//
//  Created by Don Clore on 2/20/23.
//

import XCTest

protocol ResourceTestable: AnyObject {
  func getResourceData(named name: String, withExtension extension: String) -> Data
}

extension ResourceTestable {
  func getResourceData(named name: String, withExtension ext: String) -> Data {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: name, withExtension: ext) else {
      XCTFail("Missing resource")
      return Data()
    }
  
    guard let data = try? Data(contentsOf: url) else {
      XCTFail("Failed to convert resource \(name) to Data")
      return Data()
    }
    return data
  }
}
