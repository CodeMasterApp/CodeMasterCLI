//
//  File.swift
//  
//
//  Created by Nevio Hirani on 17.09.23.
//

import ArgumentParser
import AppKit

extension CodeMasterCLI {
    struct Version: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "version",
            abstract: "Prints the version of the CLI and CodeMaster.app."
        )

        @Flag(name: .shortAndLong, help: "Only prints the version number of the CLI")
        var terse = false

        func run() throws {
            // if terse flag is set only print the cli version number
            if terse {
                print(CLI_VERSION)
                return
            }

            // Print the cli version
            print("CodeMasterCLI: \t\(CLI_VERSION)")

            // File URL of CodeEdit.app
            let appURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: "com.nhstudio.CodeMaster")

            // Check if there is an Info.plist inside CodeMaster.app
            // Then get the version number and print it out
            //
            // This will fail when CodeMaster.app is not installed
            if let url = infoPlistUrl(appURL),
               let plist = NSDictionary(contentsOf: url) as? [String: Any],
               let version = plist["CFBundleShortVersionString"] as? String {
                print("CodeMaster.app: \t\(version)")
            } else {
                print("CodeMaster.app is not installed.")
            }
        }

        private func infoPlistUrl(_ url: URL?) -> URL? {
            if let url = url?.appendingPathComponent("Contents")
                             .appendingPathComponent("Info.plist") {
                return url
            } else {
                return nil
            }
        }
    }
}
