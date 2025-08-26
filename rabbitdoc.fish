function rabbitdoc --description 'ask CodeRabbit.ai to generate docstrings for the latest pull request'
  gh pr comment (gh pr list --json number --jq '.[0].number') -b '@coderabbitai generate docstrings'
end
