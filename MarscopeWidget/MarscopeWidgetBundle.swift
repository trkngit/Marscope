//
//  MarscopeWidgetBundle.swift
//  MarscopeWidget
//
//  Created by Tarkan Surav on 8.08.2025.
//

import WidgetKit
import SwiftUI

@main
struct MarscopeWidgetBundle: WidgetBundle {
    var body: some Widget {
        MarscopeWidget()
        MarscopeWidgetControl()
        MarscopeWidgetLiveActivity()
    }
}
