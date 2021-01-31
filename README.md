# Gist-Write v1

The action to write content to a gist from an input.

See also [gist-read](https://github.com/sergeysova/gist-read-action).

## Usage

See [action.yml](./action.yml)

## Examples

Simple (just write content from input to a file to a gist):

```yaml
steps:
  - uses: sergeysova/gist-write-action@v1
    with:
      gist_id: 7bcddb642d16d291959642fc60feec9b
      file_name: example.txt
      content: "100"
```

Increment counter (read value from a gist, increment it, write to the gist):

```yaml
steps:
  - uses: sergeysova/gist-read-action@v1
    id: counter
    with:
      gist_id: 7bcddb642d16d291959642fc60feec9b
      file_name: example.txt

  - name: Increment
    id: increment
    run: |
      export COUNTER=${{steps.counter.outputs.content}}
      echo "::set-output name=value::$((COUNTER + 1))"

  - uses: sergeysova/gist-write-action@v1
    with:
      gist_id: 7bcddb642d16d291959642fc60feec9b
      file_name: example.txt
      content: ${{steps.increment.outputs.value}}
```

## License

The scripts and documentation in this project are released under the [MIT License](./LICENSE)
