import XCTest
import SourceKittenFramework
@testable import SourceKittenDaemon

class CompleterTests : XCTestCase {

    var type: ProjectType!
    var project: Project!
    var completer: Completer!

#if os(Linux) 
    let doDebug = true
#else 
    let doDebug = false
#endif

    func debugMsg(_ msg : String) {
        if(doDebug) {
            print (msg)
        }
    }

    override func setUp() {
        // debugMsg("Started SetUp")
        super.setUp()

        // debugMsg("Printing ProcessInfo.processInfo.environment")
        // for (zeKey, zeValue) in ProcessInfo.processInfo.environment {
        //     debugMsg(zeKey + " : " + zeValue)
        // }
 
        // debugMsg("Calling xcodeprojFixturePath")
        var asd = xcodeprojFixturePath()

        type = ProjectType.project(project: xcodeprojFixturePath())

        debugMsg("------- Meta-test: Poking type var -------")
        print(type)
        debugMsg("------- Success! -------\n")

        debugMsg("Poking project var...")
        debugMsg("The error seems to be in the following line.")
        debugMsg("It will fail on the 'public convenience init(propertyListData data: Data)' method,")
        debugMsg("On XCProjectFile.swift")


        project = try! Project(type: type, configuration: "Debug")
        completer = Completer(project: project)
    }

    func testCompletingAConstructor() {
        let result = completer.complete(
            URL(fileURLWithPath: completeConstructorFixturePath()),
            offset: 26)

        if let s = result.asJSONString() {
            XCTAssertTrue(s =~ "sourcetext.*init\\(x:")
        }
    }

    func testCompletingEnumConstructor() {
        let result = completer.complete(
            URL(fileURLWithPath: completeEnumConstructorFixturePath()),
            offset: 24)

        if let s = result.asJSONString() {
            XCTAssertTrue(s =~ "sourcetext.*one\\(")
            XCTAssertTrue(s =~ "sourcetext.*two\\(")
            XCTAssertTrue(s =~ "sourcetext.*three\\(")
        }
    }

    func testCompletingAMethod() {
        let result = completer.complete(
            URL(fileURLWithPath: completeMethodFixturePath()),
            offset: 48)

        if let s = result.asJSONString() {
            XCTAssertTrue(s =~ "sourcetext.*methodA")
            XCTAssertTrue(s =~ "sourcetext.*methodB")
        }
    }

    func testCompletingAMethodFromFramework() {
        let result = completer.complete(
            URL(fileURLWithPath: completeMethodFromFrameworkFixturePath()),
            offset: 69)

        if let s = result.asJSONString() {
            XCTAssertTrue(s =~ "sourcetext.*devices.withMediaType:")
        }
    }

    func testCompletingAnImportStatement() {
        let result = completer.complete(
            URL(fileURLWithPath: completeImportFixturePath()),
            offset: 7)

        if let s = result.asJSONString() {
            XCTAssertTrue(s =~ "sourcetext.*AVFoundation")
        }
    }

}

#if os(Linux)

extension CompleterTests {
    static var allTests: [(String, (CompleterTests) -> () throws -> Void)] {
        return [
            ("testCompletingAConstructor", testCompletingAConstructor),
            ("testCompletingEnumConstructor", testCompletingEnumConstructor),
            ("testCompletingAMethod", testCompletingAMethod),
            ("testCompletingAMethodFromFramework", testCompletingAMethodFromFramework),
            ("testCompletingAnImportStatement", testCompletingAnImportStatement),         
                 ]
    }
}

#endif