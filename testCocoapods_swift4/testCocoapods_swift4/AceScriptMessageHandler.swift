//
//  AceScriptMessageHandler.swift
//  testCocoapods_swift4
//
//  Created by jinsang yoo on 24/10/2018.
//  Copyright © 2018 NHN Ace. All rights reserved.
//

import Foundation
import WebKit

class AceScriptMessageHandler: NSObject, WKScriptMessageHandler {
    // MARK: - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(">> JS Console log: \(message.body)")
    }
}
