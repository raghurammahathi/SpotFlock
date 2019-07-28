//
//  DateExt.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 28/07/19.
//  Copyright © 2019 Name. All rights reserved.
//


import Foundation
import SwiftDate

extension Date {
    
    public static func pcTimeAgoFrom(_ date: Date) -> String {
        
        let secondsSince = -Int(date.timeIntervalSinceNow)
        
        //Should never hit this but handle the future case
        if secondsSince < 0 {
            return "In The Future"
        }
        
        let SECOND = 1
        let MINUTE = SECOND * 60
        // < 1 minute = "Just now"
        if secondsSince < MINUTE {
            return "Just now"
        }
        
        let HOUR = MINUTE * 60
        // < 1 hour = "x minutes ago"
        if secondsSince < HOUR {
            let minutesSince = secondsSince / MINUTE
            if minutesSince == 1 {
                return "1 min ago"
            }
            else {
                return String(format: "%d mins ago", minutesSince)
            }
        }
        
        // Today = "x hours ago"
        if date.isToday {
            //Convert to hours
            let hoursSince = secondsSince / HOUR
            
            //Handle Plural
            if hoursSince == 1 {
                return "1 hr ago"
            }
            else {
                return String(format: "%d hrs ago", hoursSince)
            }
        }
        
        let dateFormatter = DateFormatter()
        
        // Yesterday = "Yesterday at 1:28 PM"
        if date.isYesterday {
            dateFormatter.dateFormat = "h:mma"
            return String(format: "Yesterday at %@", dateFormatter.string(from:date))
        }
        
        // < Last 7 days = "Friday at 1:48 AM"
        //        if date <= date.endWeek {
        //            dateFormatter.dateFormat = "EEE 'at' h:mma"
        //            let str1 = dateFormatter.string(from:date)
        //
        //            dateFormatter.dateFormat = "d MMM yyyy"
        //            let str2 = dateFormatter.string(from:date)
        //
        //            return str1 + " - " + str2
        //        }
        
        dateFormatter.dateFormat = "d MMM yyyy 'at' h:mma"
        
        return dateFormatter.string(from:date)
}
}
