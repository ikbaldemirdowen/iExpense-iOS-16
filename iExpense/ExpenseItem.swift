//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import SwiftUI

struct ExpenseItem : Identifiable, Codable
{
    let name : String
    let price : Double
    let type : String
    var id = UUID()
}
