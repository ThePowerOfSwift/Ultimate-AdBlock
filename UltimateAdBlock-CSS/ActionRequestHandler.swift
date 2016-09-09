//
//  ActionRequestHandler.swift
//  UltimateAdBlock-CSS
//
//  Created by Eric Horstmanshof on 16-04-16.
//  Copyright © 2016 Arrow Webprojects. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "blockerList", withExtension: "json"))!
    
        let item = NSExtensionItem()
        item.attachments = [attachment]
    
        context.completeRequest(returningItems: [item], completionHandler: nil);
    }
    
}
