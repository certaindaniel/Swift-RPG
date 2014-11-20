import Quick
import Nimble

class Combatant_UnitTests: QuickSpec {
    override func spec() {
        describe("loading from plist") {
            it("loads Rabid Dog") {
                var dog:Combatant! = nil
                expect(dog = Combatant(plistName: "Rabid Dog")).toNot(raiseException())
                expect(dog).toNot(beNil())
            }
        }
    }
}
