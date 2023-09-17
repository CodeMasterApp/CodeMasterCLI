// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

// ##################################################
//  This needs to be changed prior to every release!
// ##################################################
let CLI_VERSION = "0.0.1-dev"

struct CodeMasterCLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "codemaster-cli",
        abstract: """
        A set of command line tools that ship with CodeMaster
        which allow users to open and interact with editor via the command line.

        Version: \(CLI_VERSION)
        """,
        subcommands: [Open.self, Version.self],
        defaultSubcommand: Open.self
    )

    init() {}

    enum CLIError: Error {
        case invalidWorkingDirectory
        case invalidFileURL
    }
}

CodeMasterCLI.main()
