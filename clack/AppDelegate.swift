//
//  AppDelegate.swift
//  clack
//
//  Created by Mackenzie Craig on 2018-07-04.
//  Copyright © 2018 mcknzcrg. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Launched.")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        print("Closing...")
    }

}

