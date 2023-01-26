//
//  Expenses.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import Foundation

class Expenses : ObservableObject
{
    @Published var items = [ExpenseItem]()
}
