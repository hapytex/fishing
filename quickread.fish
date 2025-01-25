function quickread --description '𝗯𝗼𝗹face the 𝗳𝗶rst 𝗹𝗲𝘁ters of 𝗲ach 𝘄ord, 𝘀𝗽𝗲eding up 𝗿𝗲𝗮ding'
  set bold (echo -en '\e[1m\e[4m')
  set endbold (echo -en '\e[22m\e[24m')
  sed -E s"/\\b(\\w{,3})(\w{3,})/$bold\1$endbold\2/g"
end
