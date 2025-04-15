function stripe --description 'add striped background colors when printing content'
  set stripea (echo -en '\e[48;2;221;235;247m\e[30m')
  set stripeb (echo -en '\e[48;2;255;255;255m\e[30m')
  set stripev (echo -en '\e[0m')
  set eol (echo -en '\e[K\e[0m')
  sed -Ez "s/([^\n]*)\n(([^\n]*)(\n))?/$stripea\1$eol\n$stripeb\3$eol\4/g"
end
