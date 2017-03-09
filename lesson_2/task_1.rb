armonth = { 
  jan: 31,
  feb: 28,
  march: 31,
  apr: 30,
  may: 31,
  jun: 30,
  jul: 31,
  aug: 31,
  sept: 30,
  oct: 31,
  nov: 30,
  dec: 31
}

armonth.each do | month, days |

  if days == 30
    puts month
  end

end