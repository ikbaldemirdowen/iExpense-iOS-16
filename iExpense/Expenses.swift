//
//  Expenses.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import Foundation

class Expenses : ObservableObject
{
    @Published var items = [ExpenseItem]() {
        //we need to save the items in our items array
        didSet {
            
            if let encoded = try? JSONEncoder().encode(items)
            {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
        
        init()
        {
            if let savedItems = UserDefaults.standard.data(forKey: "items")
            {
                if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems)
                {
                    items = decodedItems
                    return
                }
            }
            items = []
        }
        
    }

