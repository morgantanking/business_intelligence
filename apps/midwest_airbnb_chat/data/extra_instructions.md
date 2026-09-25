# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

- `host_is_superhost` uses the text values `t` and `f`, not booleans. When the user asks about Superhosts, use `t` to identify Superhost listings.

- When calculating an average `review_scores_rating`, ignore rows where `review_scores_rating` is `NULL`.