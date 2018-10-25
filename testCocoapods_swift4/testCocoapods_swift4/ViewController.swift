//
//  ViewController.swift
//  testCocoapods_swift4
//
//  Created by jinsang yoo on 24/10/2018.
//  Copyright © 2018 NHN Ace. All rights reserved.
//

import UIKit
import WebKit
import AceTM

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    @IBOutlet var wkwebView: WKWebView!
    
    var config: WKWebViewConfiguration = WKWebViewConfiguration()
    var jsctrl: WKUserContentController = WKUserContentController()
    
    override func loadView() {
        super.loadView()
        
        config.userContentController = jsctrl
        
        let topStatusBarHeight: CGFloat = 100.0;
        let bottomNativeButtonHeight: CGFloat = 80.0;
        wkwebView = WKWebView(frame:CGRect(x: UIScreen.main.bounds.origin.x,
                                           y: UIScreen.main.bounds.origin.y + topStatusBarHeight,
                                           width: UIScreen.main.bounds.size.width,
                                           height: UIScreen.main.bounds.size.height - topStatusBarHeight - bottomNativeButtonHeight),
                              configuration:config)
        wkwebView.navigationDelegate = self
        wkwebView.uiDelegate = self
        AceTM.loadView(self, wkUserContentController:jsctrl)
        let aceScriptMessageHandler: AceScriptMessageHandler = AceScriptMessageHandler()
        AceTM.showJSLog(webView: wkwebView, scriptMessageHandler: aceScriptMessageHandler, wkUserContentController: jsctrl)
        self.view.addSubview(wkwebView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AceTM.viewDidLoad(responder: self, autoPv: false)
//        guard let myURL = URL(string: "http://10.77.98.128:52273") else { return }
//        guard let myURL = URL(string: "http://mc.skmagic.com/main.html?rsMng/rsSchdByMonthPage#rsSchdByMonthPage") else { return }
        guard let myURL = URL(string: "http://mc.skmagic.com/main.html?login/loginPage#loginPage") else { return }
        
        print("AceCommon.getIsDebug(): \(AceCommon.getIsDebug())")
        let myRequest = URLRequest(url: myURL)
        wkwebView.load(myRequest)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("로드 끝")
        
        AceTM.webViewDidFinishLoad(webView: webView)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("로드 시작")
        
        AceTM.webViewDidStartLoad(webView: webView)
    }
    
    // MARK: - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        AceTM.userContentController(userContentController, didReceive: message)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: message, message: nil,
                                                preferredStyle: UIAlertController.Style.alert);
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            _ in completionHandler()}
        );
        
        self.present(alertController, animated: true, completion: {});
    }
}

