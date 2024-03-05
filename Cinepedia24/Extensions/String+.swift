//
//  String+.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//
import Foundation

public extension String {
    
    func convertDateFormat(inputDate: String) -> String {

         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let oldDate = dateFormatter.date(from: inputDate) else { return "00.00.0000" }

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MM.dd.yyyy"

         return convertDateFormatter.string(from: oldDate)
    }
    
}
