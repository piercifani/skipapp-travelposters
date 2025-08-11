import Testing
#if os(Android)
import SkipFuse
#else
import OSLog
#endif
import Foundation
@testable import TravelPostersModel

let logger: Logger = Logger(subsystem: "TravelPostersModel", category: "Tests")

struct TravelPostersModelTests {
    
    @Test
    func travelPostersModel() throws {
        logger.log("running testTravelPostersModel")
        #expect(1 + 2 == 3, "basic test")
        
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try #require(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        #expect("TravelPostersModel" == testData.testModuleName)
    }
}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
