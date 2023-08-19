//
//  DiartEntryClass.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/19.
//

import Foundation
import RealmSwift

class DiaryEntry: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var date: String = ""
    @objc dynamic var content: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
