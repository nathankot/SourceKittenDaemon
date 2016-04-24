import Foundation

let environment = NSProcessInfo.processInfo().environment

public func projectDirFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]!
}

public func xcodeprojFixturePath() -> String {
    return environment["FIXTURE_PROJECT_FILE_PATH"]!
}

public func completeConstructorFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]! +
            "/SourceKittenDaemonTests/Fixtures/CompleteConstructorFixture.swift"
}

public func completeEnumConstructorFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]! +
            "/SourceKittenDaemonTests/Fixtures/CompleteEnumConstructorFixture.swift"
}

public func completeMethodFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]! +
            "/SourceKittenDaemonTests/Fixtures/CompleteMethodFixture.swift"
}

public func completeMethodFromFrameworkFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]! +
            "/SourceKittenDaemonTests/Fixtures/CompleteMethodFromFrameworkFixture.swift"
}

public func completeImportFixturePath() -> String {
    return environment["FIXTURE_PROJECT_DIR"]! +
            "/SourceKittenDaemonTests/Fixtures/CompleteImportFixture.swift"
}

public func c400KProjectDirFixturePath() -> String {
    return environment["400K_FIXTURE_PROJECT_DIR"]!
}

public func c400KXcodeprojFixturePath() -> String {
    return environment["400K_FIXTURE_PROJECT_FILE_PATH"]!
}

public func c400KMainFixturePath() -> String {
    return c400KProjectDirFixturePath() + "/demo/main.swift"
}
