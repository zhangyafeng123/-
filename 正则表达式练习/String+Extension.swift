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
    /// swift 中提供了 ‘元组’，同时可以返回多个值
    func zyf_href() -> (link: String, text: String)?  {
        // 0. 匹配方案
        let pattern = "<a href=\"(.*?)\" .*?\">(.*?)</a>"
        // 1. 创建正则表达式，并且匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
            let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))
            else {
            return nil
        }
        //2.获取结果
        let link = (self as NSString).substring(with: result.range(at: 1))
        let text = (self as NSString).substring(with: result.range(at: 2))
                
        return (link, text)
        
        
    }
   
    
}
