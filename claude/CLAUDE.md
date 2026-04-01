- In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Plans

- Before presenting a plan, use the AskUserQuestion tool to ask any unresolved questions. Make questions extremely concise.

## Git Commits

- Never add Co-Authored-By lines to commits
- Always ask before committing or pushing

## Pull Requests

- Never include a test plan section in PR descriptions
- Never add "Generated with Claude Code" or similar attribution

## Tool Usage

- Whenever I ask you to notify me about things, or let me know about progress, always use this script like this `terminal-notifier -title "Claude Code" -message "message goes here"`. By default I would like you to ping me when you have prompted me for more input after I have asked you to do something.

## Jira

- Use curl with the Jira REST API directly (MCP server unreliable)
- Credentials stored in `~/.zsh_secrets` as `JIRA_EMAIL` and `JIRA_API_TOKEN`
- Auth: `--user "$JIRA_EMAIL:$JIRA_API_TOKEN"`
- Base URL: `https://splunk.atlassian.net`
- Get issue: `curl -s --user "$JIRA_EMAIL:$JIRA_API_TOKEN" "https://splunk.atlassian.net/rest/api/3/issue/ISSUE-KEY"`
- Add comment: `curl -s -X POST --user "$JIRA_EMAIL:$JIRA_API_TOKEN" -H "Content-Type: application/json" "https://splunk.atlassian.net/rest/api/3/issue/ISSUE-KEY/comment" -d '{"body": {"type": "doc", "version": 1, "content": [{"type": "paragraph", "content": [{"type": "text", "text": "Comment text"}]}]}}'`

## TypeScript Guidelines

When writing typescript code, adhere to the following guidelines.

- **do not** use `any`, `unknown`, or `never` types.
- **do not** use `@ts-expect-error` or `@ts-ignore` comments.
- **do not** use `as` type assertions.

## Effect (TypeScript)

- When writing Effect code, use the `effect-docs` MCP server to look up documentation.
- Prefer composition with `pipe` over intermediate variables.
