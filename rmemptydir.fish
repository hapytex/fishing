function rmemptydir --wraps='find $argv -type d -empty -delete' --description 'alias rmemptydir find $argv -type d -empty -delete'
  find $argv -type d -empty -delete;
end
