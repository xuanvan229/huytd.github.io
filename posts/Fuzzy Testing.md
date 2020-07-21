#Fuzzy Testing

#testing #engineering

Fuzz Testing is a testing method that instead of writing test cases with a predefined mock data, you generate the test data dynamically and randomly to test if some property or invariant of the test unit is true.

For example, you want to test a `reverse` function, which take a list and return the reversed copy of that list.

To test this with random data, we see that if `reverse` works properly and returns a reversed copy of its input, so if we feed that result into the `reverse` function again, we should get the original list. So the test should be:

```
(defun test_reverse (list)
  (= list (reverse (reverse (list)))))
```

By doing this, we see the few aspects of a fuzz test:

- We don't have to write test data by hand: We can generate them dynamically.
- Easier to find edge cases: Since we're generating test data, we can easily test a very large amount of data so it's easier to spot the edge cases
- Shrinking: this is a feature of a fuzz tester, whenever a test is failed, the shrinker will try to shrink the test data as small as possible to see the problem better. See more at [elm-community/shrink](https://package.elm-lang.org/packages/elm-community/shrink/latest/).

Apparently I am seeing this as a variant of Table Driven Test with the test table generated automatically, of course table driven test don't have shrinking feature.