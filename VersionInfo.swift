//
//  VersionInfo.swift
//  SwiftUINote
//
//  Created by zbeen on 2022/4/10.
//

import SwiftUI

public struct VersionInfo: View {
    @State private var appName = ""
    @State private var versionInfo = ""
    @State private var buildInfo = ""
    public init() {}
    
    public var body: some View {
        VStack(alignment:.center) {
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            CTitle(appName)
            CText("version:\(versionInfo)")
            CText("Build :\(buildInfo)")
            
        
        }
        .onAppear {
            // Read the app name, version and release build number from Info.plist.
            // For the app name we initially look for an entry with the CFBundleDisplayName. This allows the developer to override the
            // Xcode project name (CFBundleName) with a specific name for the app. If this key is missing we default to CFBundleName,
            // which should always be present.
            if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") { appName = "\(name as? String ?? "SwiftUI Note")" }
            else if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") { appName = "\(name as? String ?? "SwiftUI Note")" }
            
            if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") { versionInfo = "\(version as? String ?? "Unknown")" }
            if let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") { buildInfo = "\(build as? String ?? "Unknown")" }
        }
    }
}
