//
//  HomeViewController.swift
//  SearchZipCode
//
//  Created by nob on 2016/07/01.
//  Copyright © 2016年 menomoto. All rights reserved.
//

import UIKit

// debug kanagawa
let zipCodeUrl = "http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/14kanaga.zip"

class HomeViewController: UIViewController, NSURLSessionDownloadDelegate {

    @IBAction func tapButton(sender: AnyObject) {
        self.downloadFile()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func downloadFile() {
        print("start Download")
        // 通信のコンフィグを用意
        let myConfig:NSURLSessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("backgroundSession")
        
        // Sessionを作成する
        let mySession:NSURLSession = NSURLSession(configuration: myConfig, delegate: self, delegateQueue: nil)
        
        // ダウンロード先のURLからリクエストを生成
        if let myURL:NSURL = NSURL(string: zipCodeUrl) {
            let myRequest:NSURLRequest = NSURLRequest(URL: myURL)
            // ダウンロードタスクを生成
            let myTask:NSURLSessionDownloadTask = mySession.downloadTaskWithRequest(myRequest)
            
            // タスクを実行
            myTask.resume()
        }
        print("finish Download")

    }
    
    //ダウンロード終了時に呼び出されるデリゲート
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    }
    
    //タスク終了時に呼び出されるデリゲート
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        
        if error == nil {
            print("ダウンロードが完了しました")
        } else {
            print("ダウンロードが失敗しました")
        }
        
    }
}

