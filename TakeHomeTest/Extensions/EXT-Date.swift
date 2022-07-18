//
//  EXT-Date.swift
//  TakeHomeTest
//
//  Created by james Jones on 18/07/2022.
//

import Foundation

extension Date {
        func convertToMonthYearFormat() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d, MMM YYYY"
            return dateFormatter.string(from: self)
        }
    }
