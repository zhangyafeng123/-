//
//  String+Extension.swift
//  正则表达式练习
//
//  Created by 张亚峰 on 2018/8/29.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import Foundation

extension String {
    ///当前字符串中，提取链接和文本
    func zyf_href()  {
        // 0. 匹配方案
        let pattern = "<a href=\"(.*?)\" .*?\">(.*?)</a>"
        // 1. 创建正则表达式，并且匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
            let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))
            else {
            
            return
        }
        //2.获取结果
        let link = (self as NSString).substring(with: result.range(at: 1))
        let text = (self as NSString).substring(with: result.range(at: 2))
        
        print(link + "---" + text)
        
        
        
    }
   
    
}
