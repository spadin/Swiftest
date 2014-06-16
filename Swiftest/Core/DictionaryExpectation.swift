extension Swiftest {
  class DictionaryExpectation<Key:Hashable, Value:Comparable> : BaseExpectation {
    typealias Dict = Dictionary<Key,Value>
    
    var actual : Dict[]
    
    init(actual : Dict) {
      self.actual = [actual]
    }
    
    func not() -> DictionaryExpectation {
      self._reverse = !_reverse
      return self
    }
    
    func toEqual(expected : Dict) {
      _assert(
        _subject() == expected,
        msg : "expected <\(_subject())> to\(_includeNot()) equal <\(expected)>")
    }
    
    func toHaveKey(key : Key) {
      _assert(
        _contains({ (k, v) in k == key }),
        msg: "expected <\(_subject())> to\(_includeNot()) have key <\(key)>"
      )
    }
    
    func toHaveValue(value : Value) {
      _assert(
        _contains({ (k, v) in v == value }),
        msg: "expected <\(_subject())> to\(_includeNot()) have key <\(value)>"
      )
    }
    
    func toContain(pair : Dict) {
      _assert(
        _contains({ (k, v) in [k : v] == pair }),
        msg: "expected <\(_subject())> to\(_includeNot()) have entry <\(pair)>"
      )
    }
    
    func _subject() -> Dict {
      return actual[0]
    }
    
    func _contains(blk : (Key, Value) -> Bool) -> Bool {
      var found = false

      for (key, value) in _subject() {
        if blk(key, value) { found = true }
      }
      
      return found
    }
  }
}
