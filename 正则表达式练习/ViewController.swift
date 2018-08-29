//
//  ViewController.swift
//  正则表达式练习
//
//  Created by 张亚峰 on 2018/8/29.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //正则表达式
        // . 匹配任意字符，回车除外
        // * 匹配任意多次
        // ? 尽量少的匹配
        //正则表达式30分钟快速入门
        //http://deerchao.net/tutorials/regex/regex.htm#greedyandlazy
        
        //<a href=\"http://app.weibo.com/t/feed/5g0B8s\" rel=\"nofollow\">微博weibo.com</a>
        
        let string = "<a href=\"http://app.weibo.com/t/feed/5g0B8s\" rel=\"nofollow\">微博weibo.com</a>"
        
        let result = string.zyf_href()
        print(result?.text)
        print(result?.link)
    }

    func demo()  {
        //正则表达式
        // . 匹配任意字符，回车除外
        // * 匹配任意多次
        // ? 尽量少的匹配
        //正则表达式30分钟快速入门
        //http://deerchao.net/tutorials/regex/regex.htm#greedyandlazy
        
        //<a href=\"http://app.weibo.com/t/feed/5g0B8s\" rel=\"nofollow\">微博weibo.com</a>
        
        let string = "<a href=\"http://app.weibo.com/t/feed/5g0B8s\" rel=\"nofollow\">微博weibo.com</a>"
        
        //2.创建正则表达式
        // pattern - 常说的正则表达式，就是 pattern的写法(匹配方案)
        // 索引:
        // 0: 和匹配方案完全一致的字符串
        // 1: 第一个 () 中的内容
        // 2: 第二个 () 中的内容
        // ... 索引从左向右顺序递增
        //
        // 对于模糊匹配，如果关心的内容，就使用 (.*?),然后通过索引可以获取结果
        // 如果不关心的内容, 就是 ` .*? `, 就可以匹配任意的内容
        let pattern = "<a href=\"(.*?)\" .*?\">(.*?)</a>"
        
        //1> 常见正则表达式，如果 pattern 失败，抛出异常
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }
        //2> 进行查找，两种查找方法
        // [只找第一个匹配项/查找多个匹配项]
        guard let result = regx.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) else {
            print("没有找到匹配项")
            return
        }
        // 3> result 中只有两个重要的方法
        // result.numberOfRanges -> 查找到范围的数量
        // result.range(at: idx) -> 指定 `索引` 位置的范围
        print("找到的数量\(result.numberOfRanges)")
        
        for idx in 0..<result.numberOfRanges {
            print(result.range(at: idx))
            
            let r = result.range(at: idx)
            let subStr = (string as NSString).substring(with: r)
            
            print("下标\(idx)-\(subStr)")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

