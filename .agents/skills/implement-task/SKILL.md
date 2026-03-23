---
name: implement-task
description: Implement a task
workflow_dispatch:
  inputs:
    branch_name:
      description: "Name for the task branch"
      required: true
      type: string
    url:
      description: "Reference"
      required: true
      default: "staging"
      type: choice
      options:
        - staging
        - production
    context:
      description: "Free-form context value"
      required: false
      type: string
hooks:
  PreWorkflow:
    - matcher: "Bash"
      hooks:
        - type: command
          command: |
            "./scripts/setup.sh \
              ${{ inputs.branch_name }}" \
              ${{ inputs.url }} \
              ${{ inputs.context }}
---

Keep working on implementing the provided list of specs from the [specs](docs/specs) directory, as referenced.

Keep iterating until the workspace successfully builds, the solution has strong abstractions, is clean, and easily understood. Make sure _all_ features implemented are properly isolated and work well together.

Before implementing each chunk of functionality, add your plans to the [tasks](docs/tasks) directory. Add progress notes to the task as you work on it, and mark it as complete when done.
