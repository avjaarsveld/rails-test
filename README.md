# Rails Test

This Rails application is a foundation for the following Ruby on Rails technical test. To start the test please fork this repository and follow the instructions below.

## Tasks

1. Create an API endpoint that receives the following format `params` hash and creates the resources:

```ruby
{
  sales: [
    {
      date: '20140103',
      time: '0700',
      code: 'FL',
      value: '2.00'
    },
    {
      date: '20140103',
      time: '0815',
      code: 'DO',
      value: '1.00'
    }
  ]
}
```

2. Create a JSON API endpoint for reading all persisted sales.
3. Create a JSON API endpoint for reading a specific sale.
4. Create a JSON API endpoint for destroying a specific sale.

### Notes

* The creation API endpoint should be able to receive both a singular resource hash and an array of multiple resource hashes.

### Acceptance Criteria

* Users can upload sample CSV file (/spec/data/point-of-sale-data.csv).
* The data is saved to a database
* The sales in the upload file can be viewed in a browser

## Caveats & Rules

### Time Constraint

You should not spend more than **4 hours** on this test. We measure time spent developing as the time between your first and last commit. If you complete the test before reaching the time limit do not feel obliged to continue up to the 4 hour marker.

### Testing

We use [RSpec](https://relishapp.com/rspec) and follow an outside-in testing approach. Approach testing your work in the same way you would during your day-to-day development as we use tests as a marker for code quality.

### Quality Indicators

Please make use of quality indicators such as [CodeClimate](http://codeclimate.com), [Travis CI](travis-ci.com) and [Coveralls](https://coveralls.io). Update the provided badges in your `README.md` when setting up.

### Commit History

Please keep your commit history clear and descriptive, following best practices for Git commits. Your commit history allows us to observe your thought process and how you approach a problem.

## Tips & Hints

* Hexagonal Rails
* Demonstration of best practices
* SOLID principles
* Design patterns
* TDD
