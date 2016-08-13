# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn('PR is classed as Work in Progress', sticky: true) if github.pr_title.include? '[WIP]'

# put labels on PRs, this will autofail all PRs without contributor intervention (this is intentional to force someone to look at and categorize each PR before merging)
warn('PR needs labels', sticky: true) if github.pr_labels.empty?

# Mainly to encourage writing up some reasoning about the PR, rather than
# just leaving a title
if github.pr_body.length < 5
  warn "Please provide a summary in the Pull Request description", sticky: true
end

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn('PR is classed as Work in Progress') if github.pr_title.include? '[WIP]'

# Don't let testing shortcuts get into master by accident
fail('fdescribe left in tests') if `grep -r fdescribe specs/`.length > 1
fail('fit left in tests') if `grep -r "fit specs/ `.length > 1
