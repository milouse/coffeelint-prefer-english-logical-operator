module.exports = class PreferEnglishLogicalOperator
  rule:
    name: 'prefer_english_logical_operator'
    level: 'ignore'
    message: 'Don\'t use && or ||'
    description: '''
      This rule prohibits && and ||.
      Use "and" and "or" instead.
      '''
  tokens: ['&&', '||']

  lintToken: (token, tokenApi) ->
    # Compare the actual token with the lexed token.
    { first_column, last_column } = token[2]
    line = tokenApi.lines[tokenApi.lineNumber]
    actual_token = line[first_column..last_column]
    return false unless actual_token in ['||', '&&']
    return { context: 'Replace "||" with "or"' } if actual_token == '||'
    { context: 'Replace "&&" with "and"' }
