# gilded-rose-tech-test

# Approach:

In order to simplify the existing if/else statements I decided to use a case statement which checked the name of the items before delegating a specific function to perform the update on that item. I figured this would make the existing code a lot easier to read as well as making it easier to implement future criteria for new items. This would be done by simply adding another 'when' statement and another specific qualityUpdate method if needed.

In order to make sure that everything worked the same way as it did before I implemented any changes, I first wrote tests to check for all the specific functionality. This allowed me to make sure the logic was still working as intended.

# Dependancies:

- Rubocop(Linter)
- Simplecov(Test coverage)
- Rspec(Testing)

The only dependancies I needed were basic testing and formatting gems.

# Setup:

First fork and clone this repo.

Then in the home directory do:

```bash
bundle install
```

To see the tests do:

```bash
rspec
```
