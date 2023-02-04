//
//  Notification.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 2/3/23.
//

import Foundation

extension Notification.Name {
    static var login: Notification.Name {
        return Notification.Name("login")
    }
    
    static var logout: Notification.Name {
        return Notification.Name("logout")
    }
}

func handle_notify(_ name: Notification.Name) -> NotificationCenter.Publisher {
    return NotificationCenter.default.publisher(for: name)
}

func notify(_ name: NSNotification.Name, _ object: Any?) {
    NotificationCenter.default.post(name: name, object: object)
}
