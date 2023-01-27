//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-26.
//

import SwiftUI

extension View
{
    func style(for item : ExpenseItem) -> some View
    {
        if item.price < 10
        {
            return self.foregroundColor(.green)
        }
        else if item.price < 100
        {
            return self.foregroundColor(.yellow)
        }
        else
        {
            return self.foregroundColor(.red)
        }
    }
}
