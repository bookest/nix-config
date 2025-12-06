;; extends
((tag
  (name) @comment.safety @nospell
  ":" @punctuation.delimiter)
  (#match? @comment.safety "SAFETY"))

("text" @comment.safety @nospell
  (#match? @comment.safety "SAFETY"))
