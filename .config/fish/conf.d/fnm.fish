# fnm env --use-on-cd | source
if type -q fnm
  fnm env --shell fish --use-on-cd | source
  fnm completions --shell fish | source
end
