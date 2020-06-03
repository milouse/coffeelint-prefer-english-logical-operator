expect = require('chai').expect
coffeelint = require 'coffeelint'

coffeelint.registerRule require '../src/prefer_english_logical_operator'

configError =
  prefer_english_operator:
    level: 'ignore'
  prefer_english_logical_operator:
    level: 'error'

describe 'PreferEnglishLogicalOperator', ->
  describe 'non-English operators', ->
    it 'should warn when && is used', ->
      result = coffeelint.lint('1 && 1', configError)
      expect(result).to.be.an('array').with.a.lengthOf(1)
      expect(result[0].context).to.equal 'Replace "&&" with "and"'

    it 'should warn when || is used', ->
      result = coffeelint.lint('1 || 1', configError)
      expect(result).to.be.an('array').with.a.lengthOf(1)
      expect(result[0].context).to.equal 'Replace "||" with "or"'

  describe 'English operators', ->
    it 'should not warn when \'and\' is used', ->
      result = coffeelint.lint('1 and 1', configError)
      expect(result).to.be.an('array').that.is.empty

    it 'should not warn when \'or\' is used', ->
      result = coffeelint.lint('1 or 1', configError)
      expect(result).to.be.an('array').that.is.empty

  describe 'Comments', ->
    it 'should not warn when && is used in a comment', ->
      result = coffeelint.lint('# 1 && 1', configError)
      expect(result) \
        .to.be.an('array').that.is.empty

  describe 'Strings', ->
    it 'should not warn when && is used in a single-quote string', ->
      expect(coffeelint.lint('\'1 && 1\'', configError)) \
        .to.be.an('array').that.is.empty

    it 'should not warn when && is used in a double-quote string', ->
      expect(coffeelint.lint('"1 && 1"', configError)) \
        .to.be.an('array').that.is.empty

    it 'should not warn when && is used in a multiline string', ->
      expect(coffeelint.lint('''
        """
        1 == 1
        """
        ''', configError)).to.be.an('array').that.is.empty
