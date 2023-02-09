[> 💡 Legend definitions.]: #
[> 🔴 Major issues trigger a code review halt and status regression.]: #
[> 🟡 Minor issues trigger discussion.]: #
[> 🟢 Excellent work should be recognized and celebrated!]: #

Reviewer notes are annotated using the following legend:
> 🔴 Major issues  
> 🟡 Minor issues  
> 🟢 Excellent work  

## Merge Request Health

- [x] **Target:** The merge request targets the desired branch.
- [x] **Title:** The title is appropriate.
- [x] **Template:** The template is appropriate or an exception is provided.
- [x] **Description:** The description is complete.
    - [x] GitLab hooks are populated.
    - [x] Applicable Tasks are linked.
    - [x] Links to Tasks use the Task Title as their text.
    - [x] Links in general are formatted to be human readable.
    - [x] Checklist items are marked or provided an exception.
    - [x] All questions are answered appropriately.
    - [x] **Validation:** Validation details are provided.

        [> 🔰 A newly onboarded Junior Developer would need to ask little questions._]: #

        - [x] Little assumptions are made as to the knowledge of the reviewer. 
        - [x] Details when to expect to observe desired behaviors.
        - [x] Details when to expect to observe current behaviors.
        - [x] Details the way the end-user would validate the solution.
        - [x] For specific bugs, Details how to reproduce issues using the same data (or as close to it as possible) as production.
- [x] **Metadata:** No anomalies detected.
    - [x] Assignee.
    - [x] Reviewer.
    - [x] Milestone.
    - [x] Labels.
    - [x] Merge options.
- [x] **Pipelines:** No anomalies detected.

    [> 💡 _A good development strategy runs integration tests locally before creating a merge request._]: #

    [> 🏫 _A high average of pipelines is a key indicator of issues in Task grooming, developer analysis, or scope creep._]: #

    [> 💸 _GitLab charges for CI/CD in minutes, so keeping the number of pipelines to a minimum saves on costs._]: #

    [> 🏫 _A low average of commits per pipeline may indicate an issue in developer analysis._]: #

    - [x] The latest pipeline cleanly passes all jobs.
    - [x] There number of pipelines leans towards a minimum.
    - [x] The number of commits per pipeline leans towards a maximum.
- [x] **Readiness:** The changes can be merged.
- [x] **Activity:** No anomalies detected.
    - [x] The merge request was created in draft status.
    - [x] The merge request was in draft status during subsequent pushes.

## Code Health

- [x] **Commits**: No anomalies detected.

    [> 🏫 _Commits with large changes indicates the developer is thinking locally rather than globally._]: #

    [> 💡 _Sometimes the path to a solution isn't clear, and a messy commit log is inevitable. A good development strategy may use a "draft branch" where the developer can be as messy as they want. But once they know the final solution, They'll create a new branch for publishing. Then, commit small, clean changes until there are no diffs between the draft branch and the publishing branch. Doing this will often reveal uncosidered issues, too._]: #

    - [x] Commit changes are small.
    - [x] Commit messages are informative.
    - [x] Documentation is changed in the same commit as associated functional changes.
- [x] **Best Practices:** The code doesn't smell.

    [> 🏫 _Smelly code indicates the developer didn't review the final diffs before creating the merge request, or inexperience._]: #

    - [x] Changes are easy to reason about.
    - [x] Complex logic checks are extracted to variables.
    - [x] Symbols have meaningful names.
- [x] **Tests:** No anomalies detected.

    [> 🏫 _If `if` statements are touched by the diffs, there should usually be an associated test._]: #

    - [x] Changes to business logic are covered.
    - [x] Tests are verbose.
    - [x] Test specs are partitioned appropriately.
    - [x] Test spec descriptions are informative.
    - [x] Test spec descriptions are free of typos.
- [x] **Documentation:** No anomalies detected.

    [> 💡 _Documentation can take form in descriptive naming, comments, helpdocs, test specs, and READMEs._]: #

    - [x] Changes to business logic have associated documentation changes.
    - [x] Documentation is changed at an appropriate level of abstraction.

## Solution Behavior

[> 💡 _Trust, but verify. A recording may be informative, but it isn't always sufficient._]: #

[> 🛑 _Reproduce issues at least once on a development server._]: #

[> 🛑 _Reproduce desired behaviors on a development server after every major push to the remote._]: #

- [x] The solution produces the desired behavior.

    [> 🚨 _Paste unfulfilled requirements here._]: #
