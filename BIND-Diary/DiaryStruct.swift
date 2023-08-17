//
//  DiaryStruct.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/17.
//

import Foundation

struct Post: Hashable, Identifiable {
    var id: ObjectIdentifier
    let date: String
    var content: String
}
