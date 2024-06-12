
animasyonlandirici = {}

function animasyonlandirici.seramoni1(gabagsayinode,gabagnode,gameover,temanode,karakternode)

	gui.set_enabled(gabagsayinode, false)
	gui.set_color(gabagnode, vmath.vector4(1,1,1,0))
	gui.set_position(gabagnode, vmath.vector3(145, 270, 0))
	gui.set_enabled(gabagnode, true)

	timer.delay(0.5, false, function() sound.play("#gabag") end)

	gui.animate(gabagnode,
	gui.PROP_COLOR,
	vmath.vector4(1,1,1,1),
	gui.EASING_INQUINT,1.3,0)
	gui.set_enabled(gabagnode, true)
	gui.animate(gabagnode,
	gui.PROP_SCALE,
	vmath.vector3(3.5,3.5,0),
	gui.EASING_INQUINT,1.5,0,
	function()
		gui.animate(gabagnode,
		gui.PROP_SCALE,
		vmath.vector3(0.3,0.3,0),
		gui.EASING_INQUINT,1,1)

		gui.animate(gabagnode,
		gui.PROP_POSITION,
		vmath.vector3(30,460,0),
		gui.EASING_INQUINT,1,1,
		function()
			timer.delay(2, false,
			function()
				gui.set_enabled(gabagsayinode, true)
				sound.play("#puan")
				timer.delay(2, false, function()
					
					gui.animate(gameover, gui.PROP_POSITION, vmath.vector3(144,425 ,0), gui.EASING_LINEAR, 0.25,0,nil,gui.PLAYBACK_ONCE_FORWARD)
					gui.set_position(karakternode, vmath.vector3(-800,345,0))
					gui.set_position(temanode, vmath.vector3(1000,345,0))
					gui.set_enabled(karakternode, true)
					gui.set_enabled(temanode, true)
					gui.animate(karakternode, gui.PROP_POSITION, vmath.vector3(91,345,0), gui.EASING_LINEAR, 0.55,0,nil,gui.PLAYBACK_ONCE_FORWARD)
					gui.animate(temanode, gui.PROP_POSITION, vmath.vector3(197,345,0), gui.EASING_LINEAR, 0.55,0,nil,gui.PLAYBACK_ONCE_FORWARD)

					timer.delay(2, false, replaybuttongetir)
				end)
			end)
		end)
	end)
end

function animasyonlandirici.seramoni2katlayici(katlayicinode,gcoinsayinode,puananimasyoncusunode,bestanimasyoncusunode,score,bestscorenode,scoreintabnode,kat)

	gui.set_text(puananimasyoncusunode, score)
	gui.set_text(bestanimasyoncusunode, math.max(Kayitci.kaydidondur("best"), score))
	gui.set_enabled(puananimasyoncusunode, true)
	gui.set_enabled(bestanimasyoncusunode, true)
	gui.set_enabled(bestscorenode, false)
	gui.set_enabled(scoreintabnode, false)

	gui.animate(bestanimasyoncusunode, gui.PROP_SCALE, 3, gui.EASING_OUTBACK, 0.3)
	gui.animate(bestanimasyoncusunode, gui.PROP_POSITION, vmath.vector3(84,265,0), gui.EASING_OUTBACK, 0.3)
	gui.animate(puananimasyoncusunode, gui.PROP_SCALE, 3, gui.EASING_OUTBACK, 0.3)
	gui.animate(puananimasyoncusunode, gui.PROP_POSITION, vmath.vector3(204,265,0), gui.EASING_OUTBACK, 0.3, 0, function()
		gui.animate(bestanimasyoncusunode, gui.PROP_POSITION, vmath.vector3(144,265,0), gui.EASING_INEXPO, 0.3)
		gui.animate(puananimasyoncusunode, gui.PROP_POSITION, vmath.vector3(144,265,0), gui.EASING_INEXPO, 0.3, 0, function()

			gui.set_enabled(bestanimasyoncusunode, false)
			gui.set_text(puananimasyoncusunode, tonumber(gui.get_text(puananimasyoncusunode))+tonumber(gui.get_text(bestanimasyoncusunode)))

			gui.animate(puananimasyoncusunode, gui.PROP_POSITION, vmath.vector3(144,400,0), gui.EASING_OUTBACK, 0.3, 0.3, function()

				gui.set_text(bestanimasyoncusunode, "x"..kat)
				gui.set_scale(bestanimasyoncusunode, vmath.vector3(0.3,0.3,0))
				gui.set_enabled(bestanimasyoncusunode, true)
				gui.animate(bestanimasyoncusunode, gui.PROP_SCALE, 3, gui.EASING_OUTBACK, 0.3,0,function()
					gui.animate(bestanimasyoncusunode, gui.PROP_POSITION, vmath.vector3(144,332,0), gui.EASING_INEXPO, 0.3)
					gui.animate(puananimasyoncusunode, gui.PROP_POSITION, vmath.vector3(144,332,0), gui.EASING_INEXPO, 0.3,0,function()
						gui.set_enabled(bestanimasyoncusunode, false)
						gui.set_text(puananimasyoncusunode, tonumber(gui.get_text(puananimasyoncusunode))*kat)
						gui.animate(puananimasyoncusunode, gui.PROP_POSITION, vmath.vector3(66,488,0), gui.EASING_INEXPO, 0.5,0.5)
						gui.animate(puananimasyoncusunode, gui.PROP_SCALE, vmath.vector3(1,1,0), gui.EASING_INEXPO, 0.5,0.5,function()
							gui.set_text(gcoinsayinode, Kayitci.kaydidondur("gcoin"))
							gui.set_enabled(puananimasyoncusunode, false)

							gui.set_scale(bestscorenode, vmath.vector3(0.1,0.1,0))
							gui.set_scale(scoreintabnode, vmath.vector3(0.1,0.1,0))
							gui.set_enabled(bestscorenode, true)
							gui.set_enabled(scoreintabnode, true)
							gui.animate(bestscorenode, gui.PROP_SCALE, vmath.vector3(1,1,1), gui.EASING_OUTBACK, 0.3)
							gui.animate(scoreintabnode, gui.PROP_SCALE, vmath.vector3(1,1,1), gui.EASING_OUTBACK, 0.3)
						end)
					end)
				end)
			end)
		end)
	end)
end

local shaking = false

function animasyonlandirici.shake(node1, node2)
	if not shaking then
		shaking = true
		local duration = 0.05
		local shake_intensity = 3
		local original_position1 = gui.get_position(node1)
		gui.animate(node1, "position.x", original_position1.x - shake_intensity, gui.EASING_OUTELASTIC, duration, 0, function()
			gui.animate(node1, "position.x", original_position1.x + shake_intensity, gui.EASING_OUTELASTIC, duration, 0, function()
				gui.animate(node1, "position.x", original_position1.x, gui.EASING_OUTELASTIC, duration)
			end)
		end)
		if node2 then
			local original_position2 = gui.get_position(node2)
			gui.animate(node2, "position.x", original_position2.x - shake_intensity, gui.EASING_OUTELASTIC, duration, 0, function()
				gui.animate(node2, "position.x", original_position2.x + shake_intensity, gui.EASING_OUTELASTIC, duration, 0, function()
					gui.animate(node2, "position.x", original_position2.x, gui.EASING_OUTELASTIC, duration, 0, function()
						shaking = false
					end)
				end)
			end)
		else
			shaking = false
		end
	end
end


function animasyonlandirici.alamama(gcoin,buton)
	animasyonlandirici.shake(gcoin)
end

return animasyonlandirici



