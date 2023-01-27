//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-26.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency
{
    static var localCurrency  : Self
    {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
