//
//  AppDelegate.swift
//  loot
//
//  Created by marco on 13.04.20.
//  Copyright © 2020 zero.io. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowMode: Bool = false
    var window: NSWindow!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
//        window = NSWindow(
//            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
//            styleMask: [
//                .titled,
//                .closable,
//                .miniaturizable,
//                .resizable,
//                .fullSizeContentView
//            ],
//            backing: .buffered, defer: false)
//        window.center()
//        window.setIsVisible(false)
//        window.setFrameAutosaveName("Main Window")
//        window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)

        // Create the popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.behavior = .transient
        popover.animates = false
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            button.action = #selector(togglePopover(_:))            
        }

    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(
                    relativeTo: button.bounds,
                    of: button,
                    preferredEdge: NSRectEdge.minY
                )
                self.popover.contentViewController?.view.window?.becomeKey()
            }
        }
        
    }
    
//    @objc func toggleWindow(_ sender: AnyObject?) {
//
//        if let button = self.statusBarItem.button {
//
//            if self.window.isVisible {
//
//                self.window.setIsVisible(false)
//
//            } else {
//
//                self.window.setIsVisible(true)
//                self.window.contentViewController?.view.window?.becomeKey()
//
//            }
//        }
//    }
    
}

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
