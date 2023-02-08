# Code Review Template
  
Authored by Malcolm Burtenshaw  
Version 1.0.0

_Want to contribute? Email me at mjburtenshaw@gmail.com_

---

## Foreword

This document is not intended to have all it's content used all the time. Take excerpts from it on each code review you perform to develop a thorough culture on your team. In full, this document is also helpful to set proper expectations for new members of your team.

👉 _Notes to the reviewer are italicized and marked by emojis, and are not intended for the receiving audience. I recommend removing them before publishing._

Checkboxes are pre-marked to save you time. Ideally, most items will be addressed by change request authors, so it _should_ be less work to uncheck items, rather than check them.

Overtime, the goal of this document is to not be used at all. In the fullness of times, a "LGTM" will be all you need. On that note, here is a quote that captures the spirit of this document:

 ### [End the debate once and for all. Do writing the objectives on the board do anything?](https://www.reddit.com/r/Teachers/comments/10vq3sn/end_the_debate_once_and_for_all_do_writing_the/j7iz4g1/?context=3)

> _You can't see inside your kids' minds to know if they are learning. So you design imperfect and sometimes even arbitrary and burdensome mechanisms to assess their learning and compliance. If all your kids were earnest and focused, many of these mechanisms would not be necessary._

> _Admin cannot see inside your mind to make sure teachers are following their objectives. So they implement imperfect and sometimes even arbitrary and burdensome mechanisms to assess whether the teachers actually have plans. If all your teacher colleagues were earnest and followed through, many of these mechanism would not be necessary._

> _For the first 90 seconds of class I have trained my 7th and 8th graders to assume total silence upon the bell and copy the objective into their planner. Does this help them learn? Not really. But it is a powerful management tool to calm and quiet the class, make sure they have a pencil in hand, and then quickly transition their attention to our first lesson activity._

> _But why not do a warm up? Because kids were absent and don't know, can't do the warm up, etc. and then they cause problems. What can everyone do no matter what? Everyone can copy a sentence off the board._

\- [u/Herodotus_Runs_Away](https://www.reddit.com/user/Herodotus_Runs_Away/) in response to [a question](https://www.reddit.com/r/Teachers/comments/10vq3sn/end_the_debate_once_and_for_all_do_writing_the/j7iz4g1/?context=3) from [u/TeacherGuy1980](https://www.reddit.com/user/TeacherGuy1980/) on [r/Teachers](https://www.reddit.com/r/Teachers/).

---

## Change Request Health

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
    - [x] Little assumptions are made as to the knowledge of the reviewer.  
    _e.g., a newly onboarded Junior Developer would need to ask little questions._
- [x] **Metadata:** No anomalies detected.
    - [x] Assignee.
    - [x] Reviewer.
    - [x] Milestone.
    - [x] Labels.
    - [x] Merge options.
- [x] **Pipelines:** No anomalies detected.  
    💡 _A good development strategy runs integration tests locally before creating a merge request._  
    🏫 _A high average of pipelines is a key indicator of issues in Task grooming, developer analysis, or scope creep._  
    💸 _GitLab charges for CI/CD in minutes, so keeping the number of pipelines to a minimum saves on costs._  
    🏫 _A low average of commits per pipeline may indicate an issue in developer analysis._
    - [x] The latest pipeline cleanly passes all jobs.
    - [x] There number of pipelines leans towards a minimum.
    - [x] The number of commits per pipeline leans towards a maximum.
- [x] **Readiness:** The changes can be merged.
- [x] **Activity:** No anomalies detected.
    - [x] The merge request was created in draft status.
    - [x] The merge request was in draft status during subsequent pushes.

## Code Health

- [x] **Commits**: No anomalies detected.  
    🏫 _Commits with large changes indicates the developer is thinking locally rather than globally._  
    💡 _Sometimes the path to a solution isn't clear, and a messy commit log is inevitable. A good development strategy may use a "draft branch" where the developer can be as messy as they want. But once they know the final solution, They'll create a new branch for publishing. Then, commit small, clean changes until there are no diffs between the draft branch and the publishing branch. Doing this will often reveal uncosidered issues, too._
    - [x] Commit changes are small.
    - [x] Commit messages are informative.
    - [x] Documentation is changed in the same commit as associated functional changes.
- [x] **Best Practices:** The code doesn't smell.  
    🏫 _Smelly code indicates the developer didn't review the final diffs before creating the merge request, or inexperience._
    - [x] Changes are easy to reason about.
    - [x] Complex logic checks are extracted to variables.
    - [x] Symbols have meaningful names.
- [x] **Tests:** No anomalies detected.  
    🏫 _If `if` statements are touched by the diffs, there should usually be an associated test._
    - [x] Changes to business logic are covered.
    - [x] Tests are verbose.
    - [x] Test specs are partitioned appropriately.
    - [x] Test spec descriptions are informative.
    - [x] Test spec descriptions are free of typos.
- [x] **Documentation:** No anomalies detected.  
    💡 _Documentation can take form in descriptive naming, comments, helpdocs, test specs, and READMEs._
    - [x] Changes to business logic have associated documentation changes.
    - [x] Documentation is changed at an appropriate level of abstraction.

## Solution Behavior

💡 _Trust, but verify. A recording may be informative, but it isn't always sufficient._  
🛑 _Reproduce issues at least once on a development server._  
🛑 _Reproduce desired behaviors on a development server after every major push to the remote._

- [x] Validation details are provided.
- [x] Validation details when to expect to observe desired behaviors.
- [x] Validation details when to expect to observe current behaviors.
- [x] Validation is set up the way the end-user would validate the solution.
- [x] Little assumptions are made as to the knowledge of the reviewer.
- [x] For specific bugs, validation details how to reproduce issues using the same data (or as close to it as possible) as production?
