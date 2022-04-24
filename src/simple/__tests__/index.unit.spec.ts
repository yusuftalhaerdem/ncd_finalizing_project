import * as contract from "../assembly";

describe("Contract", () => {
  // VIEW method tests

  it("saves data to contract storage", () => {
    expect(contract.get_dict_element("some-phrase")).toStrictEqual("✅ Data saved. ( storage [ 18 bytes ] )")
  })

  // CHANGE method tests
  it("adds word to dictionary and prints it", () => {
    expect(contract.add_to_dictionary("deneme","pls")).toStrictEqual("hello world")
  })
})
