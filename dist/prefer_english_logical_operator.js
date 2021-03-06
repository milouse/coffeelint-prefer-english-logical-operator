// Generated by CoffeeScript 2.1.1
(function() {
  var PreferEnglishLogicalOperator;

  module.exports = PreferEnglishLogicalOperator = (function() {
    class PreferEnglishLogicalOperator {
      lintToken(token, tokenApi) {
        var actual_token, first_column, last_column, line;
        // Compare the actual token with the lexed token.
        ({first_column, last_column} = token[2]);
        line = tokenApi.lines[tokenApi.lineNumber];
        actual_token = line.slice(first_column, +last_column + 1 || 9e9);
        if (actual_token !== '||' && actual_token !== '&&') {
          return false;
        }
        if (actual_token === '||') {
          return {
            context: 'Replace "||" with "or"'
          };
        }
        return {
          context: 'Replace "&&" with "and"'
        };
      }

    };

    PreferEnglishLogicalOperator.prototype.rule = {
      name: 'prefer_english_logical_operator',
      level: 'warn',
      message: 'Don\'t use && or ||',
      description: 'This rule prohibits && and ||.\nUse "and" and "or" instead.'
    };

    PreferEnglishLogicalOperator.prototype.tokens = ['&&', '||'];

    return PreferEnglishLogicalOperator;

  }).call(this);

}).call(this);
