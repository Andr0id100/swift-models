import TensorFlow
import XCTest
import Datasets

final class OxfordIIITPets: XCTestCase {
    func testCreateOxfordIIITPets() {
        let dataset = OxfordIIITPets(batchSize: 64)

        let batchCount = 0
        for batch in dataset.training.sequenced() {
            batchCount += 1
            /// 3680 samples make 57 batches of size 64 and one batch of size 32
            let expectedBS = batchCount <= 57 ? 64 : 32

            XCTAssert(batch.first.shape, [expectedBS, 224, 224, 3])
            XCTAssert(batch.second.shape, [expectedBS, 224, 224, 1])
        }
        XCTAssertEqual(batchCount, dataset.training.count)
    }
}

extension OxfordIIITPetsTests {
    static var allTests = [
        ("testCreateOxfordIIITPets", testCreateOxfordIIITPets),
    ]
}