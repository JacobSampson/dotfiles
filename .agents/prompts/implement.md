Keep working on implementing the provided list of specs from the [specs directory](../specs), as referenced.

Keep iterating until the workspace successfully builds, the solution has strong abstractions, is clean, and easily understood. Make sure _all_ features implemented are properly isolated and work well together.

Before implementing each chunk of functionality, add your plans to the [tasks directory](../tasks). Add progress notes to the task as you work on it, and mark it as complete when done.

---

Prefer to be concise and simple with your approach. Avoid duplicated code and re-implementing exiting functionality. Always be aware of where code _should_ go.

- DO keep code in separated areas where possible
- DO keep implementation simple and free of comments
- Do NOT keep backwards compatibility. Break legacy implementations where needed and remove deprecated code.
- Re-factor and re-organize as-needed, as you go.

Be generic in your implementation. Think think thoroughly through the abstractions you create and consider if there is a more powerful variant that preserves functionality without major sacrifices.

- ALWAYS use a strong sense of module isolation
- Do NOT plan one-off variants or implementations, unless absolutely necessary and properly isolated.
- ALWAYS consider how the implementation will work long-term and be extensible.
- ALWAYS check with the user if there are open questions, conflicts, or fundamental issues with the approach.
