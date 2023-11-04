# Buildevents Buildkite Plugin

Send honeycomb traces for buildkite builds.

## Scripts available for use in commands

* `be_cmd <name> -- <command>` expands to `.../buildevents cmd ... <command>`.  Prefix any shell comand with `be_cmd <name --` to create a span in the build trace.

* `be_status success|failure` sends the root span for the build with the given status.  It should be the last thing done in the build.

## Example

```yaml
steps:
  # each step becomes a span in the trace.  This one will have the name
  # "do-something" and will have one child span named "something-quite-slow"
  - label: "Do something"
    key: "do-something"  
    plugins:
      - seek-oss/aws-sm#v2.3.1:
          env:
            BUILDEVENT_APIKEY: honeycomb-api-key
            BUILDKITE_API_TOKEN: buildkite-api-token
          commands:
            - "be_cmd something-quite-slow -- sleep 5"
      - replayio/buildevents#v0.1: ~


  # wait blocks executing the commands below until everything above is done
  - wait

  # this step will both send a span for the step (named "build-succeeded"),
  # and also send the root span for the build trace with the status "success"
  - label: "Build Succeeded"
    key: "build-succeeded"
    plugins:
      - seek-oss/aws-sm#v2.3.1:
          env:
            BUILDEVENT_APIKEY: honeycomb-api-key
            BUILDKITE_API_TOKEN: buildkite-api-token
      - replayio/buildevents#v0.1: ~
    command: "be_status success"
```
