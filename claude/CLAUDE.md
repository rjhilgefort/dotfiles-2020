- In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Plans

- Before presenting a plan, use the AskUserQuestion tool to ask any unresolved questions. Make questions extremely concise.

## Tool Usage

- Whenever I ask you to notify me about things, or let me know about progress, always use this script like this `terminal-notifier -title "Claude Code" -message "message goes here"`. By default I would like you to ping me when you have prompted me for more input after I have asked you to do something.

## TypeScript Guidelines

When writing typescript code, adhere to the following guidelines.

- **do not** use `any`, `unknown`, or `never` types.
- **do not** use `@ts-expect-error` or `@ts-ignore` comments.
- **do not** use `as` type assertions.
