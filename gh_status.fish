function gh_status --description 'set the GitHub status' -a message -a emoji -a exp -a limit
  test -n "$exp" && set exp (date '+%Y-%m-%d %H:%M:%S%z' -d "$exp")
  gh api graphql --raw-field emoji=":$emoji:" --raw-field message="$message" --raw-field expires="$exp" --field limit=$limit --raw-field query='
    mutation UpdateStatus($emoji: String!, $message: String!, $expires: DateTime, $limit: Boolean!) {
      changeUserStatus(input:{emoji: $emoji, message: $message, expiresAt: $expires, limitedAvailability: $limit}) {
        clientMutationId
        status {
          emoji
          message
          expiresAt,
          updatedAt
          user {
            login
          }
        }
      }
    }' >/dev/null 2>/dev/null &
end
