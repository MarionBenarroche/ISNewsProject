//
//  DateFormater.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 12/04/2023.
//

import Foundation

class DateFormater {
     // Formate a string date to a French format
     func formateStringToFrenchFormat(date: String) -> String? {
         // Initialize dateFormater
         let dateFormatter = DateFormatter()
         // Set local to France
         dateFormatter.locale = Locale(identifier: "FR-fr")
         // Set French date format
         dateFormatter.dateFormat = "dd/MM/yyy HH:mm"
         // Format the date
         let formatedDate = dateFormatter.date(from: date)
         
         return dateFormatter.string(from: formatedDate ?? Date())
     }
}
