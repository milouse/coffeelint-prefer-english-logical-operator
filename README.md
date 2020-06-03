# coffeelint-prefer-english-logical-operator

coffeelint-prefer-english-logical-operator is a plugin of
[coffeelint](http://www.coffeelint.org/). It checks for `&&` and `||`.

```
a and b  # yes
a && b  # no

a or b  # yes
a || b  # no

```

## How to Install

1. add `"coffeelint-prefer-english-logical-operator": "0.2.0"` as
   `devDependencies` in `package.json`
2. `npm install`

## How to Use

In your `coffeelint.json`, add

```
{
  // other lint rules
  {
    "prefer_english_logical_operator": {
      "module": "coffeelint-prefer-english-logical-operator",
      "level": "error"
    }
  }
}
```

and run `coffeelint`.
