require 'robot'

class SittingDuck
   include Robot

  def tick events
    turn_radar 5 if time == 0
    fire 3 unless events['robot_scanned'].empty? 
    turn_gun 10
	
	@last_hit = time unless events['got_hit'].empty? 
	if @last_hit && time - @last_hit < 20
      accelerate(1) 
	else
      stop	
	end
  end
end