//
//  Date.swift
//  okane-ios
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Franklin Schrans. All rights reserved.
//

class Date {
    var year: Int
    var month: Int
    var day: Int
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    func getYear() -> Int {
        return year
    }
    
    func getMonth() -> Int {
        return month
    }
    
    func getDay() -> Int {
        return day
    }
}